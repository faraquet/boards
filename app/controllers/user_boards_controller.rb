class UserBoardsController < ApplicationController
  before_action :set_user_board, only: [:show, :edit, :update, :destroy]

  # GET /user_boards
  # GET /user_boards.json
  def index
    @user_boards = UserBoard.all
  end

  # GET /user_boards/1
  # GET /user_boards/1.json
  def show
  end

  # GET /user_boards/new
  def new
    @user_board = UserBoard.new
  end

  # GET /user_boards/1/edit
  def edit
  end

  # POST /user_boards
  # POST /user_boards.json
  def create
    @user_board = UserBoard.new(user_board_params)

    respond_to do |format|
      if @user_board.save
        format.html { redirect_to @user_board, notice: 'User board was successfully created.' }
        format.json { render :show, status: :created, location: @user_board }
      else
        format.html { render :new }
        format.json { render json: @user_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_boards/1
  # PATCH/PUT /user_boards/1.json
  def update
    respond_to do |format|
      if @user_board.update(user_board_params)
        format.html { redirect_to @user_board, notice: 'User board was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_board }
      else
        format.html { render :edit }
        format.json { render json: @user_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_boards/1
  # DELETE /user_boards/1.json
  def destroy
    @user_board.destroy
    respond_to do |format|
      format.html { redirect_to user_boards_url, notice: 'User board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_board
      @user_board = UserBoard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_board_params
      params.require(:user_board).permit(:name, :email, :question)
    end
end
