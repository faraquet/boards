class AnswerMailer < ActionMailer::Base
  default from: "noreply@boards.com"
  layout 'mailer'

  class << self
    def send_answer_email(user_board, answer)
      answer_email(user_board, answer).deliver_later
    end
  end

  def answer_email(user_board, answer)
    @user_board = user_board
    @answer     = answer
    @user_board_path = url_for(user_board)
    mail(to: @user_board.email, subject: "User board #{user_board.id} received a new answer")
  end
end