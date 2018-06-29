class AnswersController < ApplicationController
  before_action :set_user_board

  def create
    puts current_admin
    @answers = @user_board.answers.create(answer_params.merge(admin_email: current_admin.email))
    redirect_to @user_board
  end

  private

  def set_user_board
    @user_board = UserBoard.find(params[:user_board_id])
  end

  def answer_params
    params[:answer].permit(:content)
  end
end
