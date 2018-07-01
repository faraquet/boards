require 'rails_helper'

RSpec.describe BoardMailer, type: :mailer do
  describe 'notice' do
    context 'new board email' do
      let(:user_board) { build(:user_board_with_email) }
      let(:mail) { BoardMailer.board_email(user_board, user_board.email) }

      it 'renders the headers' do
        expect(mail.subject).to eq("User board #{user_board.id} was created.")
        expect(mail.to).to eq([user_board.email])
        expect(mail.from).to eq([BoardMailer.default[:from]])
      end

      it 'body does contain new user board url' do
        expect(mail.body.encoded).to match(url_for(user_board))
      end
    end

    context 'complete board email' do
      let(:user_board) { build(:user_board_with_email) }
      let(:admin) { create(:admin) }
      let(:mail) { BoardMailer.board_complete_email(user_board, user_board.email, admin.email) }

      it 'renders the headers' do
        expect(mail.subject).to eq("User board #{user_board.id} was completed.")
        expect(mail.to).to eq([user_board.email])
        expect(mail.from).to eq([BoardMailer.default[:from]])
      end

      it 'body does contain admin email' do
        expect(mail.body.encoded).to match(admin.email)
      end
    end
  end

  describe 'notice to many people' do
    ADMINS_COUNT = 3
    let(:user_board_with_email) { create(:user_board_with_email) }
    let(:user_board_without_email) { create(:user_board) }

    before(:all) { ADMINS_COUNT.times { create(:admin) } }
    after(:all) { Admin.destroy_all }

    context 'emails list does contain' do
      it 'admins and board creator' do
        expect(BoardMailer.emails(user_board_with_email).size).to be(ADMINS_COUNT + 1)
      end

      it 'only admins' do
        expect(BoardMailer.emails(user_board_without_email).size).to be(ADMINS_COUNT)
      end
    end

    context 'job queue' do
      it 'is filled with admins' do
        expect {
          BoardMailer.send_board_email(user_board_without_email)
        }.to have_enqueued_job.on_queue('mailers').at_least(ADMINS_COUNT).times
      end

      it 'is filled with admins and board creator' do
        expect {
          BoardMailer.send_board_email(user_board_with_email)
        }.to have_enqueued_job.on_queue('mailers').at_least(ADMINS_COUNT + 1).times
      end
    end
  end
end
