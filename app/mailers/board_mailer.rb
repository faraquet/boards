class BoardMailer < ActionMailer::Base
  default from: 'noreply@boards.com'
  layout 'mailer'

  class << self
    def emails(user_board = nil)
      emails = Admin.pluck(:email)
      emails << user_board.email if user_board&.email.present?
      emails
    end

    def send_board_email(user_board)
      emails(user_board).each do |email|
        board_email(user_board, email).deliver_later
      end
    end

    def send_board_complete_email(user_board, admin_email)
      emails(user_board).each do |email|
        board_complete_email(user_board, email, admin_email).deliver_later
      end
    end
  end

  def board_email(user_board, email)
    @user_board      = user_board
    @user_board_path = url_for(user_board)
    mail(to: email, subject: "User board #{user_board.id} was created.")
  end

  def board_complete_email(user_board, email, admin_email)
    @user_board  = user_board
    @admin_email = admin_email
    mail(to: email, subject: "User board #{user_board.id} was completed.")
  end
end