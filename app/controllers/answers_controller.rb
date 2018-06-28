class AnswersController < ApplicationController
  before_action :set_user_board

  def create
    @answers = @user_board.answers.create(answer_params)
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
