class AnswersController < ApplicationController
  before_action :set_user_board
  before_action :authenticate_admin!

  def create
    @answer = @user_board.answers.new(answer_params.merge(admin_email: current_admin.email))
    if @answer.save
      BoardMailer.answer_email(@user_board, @answer)
      redirect_to @user_board
    end
  end

  private

  def set_user_board
    @user_board = UserBoard.find(params[:user_board_id])
  end

  def answer_params
    params[:answer].permit(:content)
  end
end
