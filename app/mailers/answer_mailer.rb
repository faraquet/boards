class AnswerMailer < ActionMailer::Base
  default from: "noreply@boards.com"
  layout 'mailer'

  def answer_email(user_board, answer)
    @user_board = user_board
    @answer     = answer
    mail(to: email, subject: "User board #{user_board.id} received a new answer")
  end
end