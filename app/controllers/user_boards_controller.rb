class UserBoardsController < ApplicationController
  before_action :set_user_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy]

  def index
    @user_boards = UserBoard.uncompleted
  end

  def show
  end

  def new
    @user_board = UserBoard.new
  end

  def create
    @user_board = UserBoard.new(user_board_params)

    if @user_board.save
      BoardMailer.send_board_email(@user_board)
      redirect_to @user_board, notice: "User board was successfully created. Board id: #{@user_board.id}"
    else
      render :new
    end
  end

  def update
    @user_board.update_attribute(:completed_at, Time.now)
    BoardMailer.send_board_complete_email(@user_board, current_admin.email)
    redirect_to :root, notice: "User board #{@user_board.id} was successfully completed."
  end

  def destroy
    @user_board.destroy
    redirect_to user_boards_url, notice: 'User board was successfully destroyed.'
  end

  private

  def set_user_board
    @user_board = UserBoard.find(params[:id])
  end

  def user_board_params
    params.require(:user_board).permit(:name, :email, :question)
  end
end
