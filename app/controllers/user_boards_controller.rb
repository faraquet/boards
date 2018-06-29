class UserBoardsController < ApplicationController
  before_action :set_user_board, only: [:show, :edit, :update, :destroy]

  def index
    @user_boards = UserBoard.all
  end

  def show
  end

  def new
    @user_board = UserBoard.new
  end

  def edit
  end

  def create
    @user_board = UserBoard.new(user_board_params)

    if @user_board.save
      redirect_to @user_board, notice: 'User board was successfully created.'
    else
      render :new
    end
  end

  def update
    @user_board.update_attribute(:completed_at, Time.now)
    redirect_to :root, notice: 'User board was successfully completed.'
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
