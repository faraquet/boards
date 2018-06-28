require 'test_helper'

class UserBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_board = user_boards(:one)
  end

  test "should get index" do
    get user_boards_url
    assert_response :success
  end

  test "should get new" do
    get new_user_board_url
    assert_response :success
  end

  test "should create user_board" do
    assert_difference('UserBoard.count') do
      post user_boards_url, params: { user_board: { email: @user_board.email, name: @user_board.name, question: @user_board.question } }
    end

    assert_redirected_to user_board_url(UserBoard.last)
  end

  test "should show user_board" do
    get user_board_url(@user_board)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_board_url(@user_board)
    assert_response :success
  end

  test "should update user_board" do
    patch user_board_url(@user_board), params: { user_board: { email: @user_board.email, name: @user_board.name, question: @user_board.question } }
    assert_redirected_to user_board_url(@user_board)
  end

  test "should destroy user_board" do
    assert_difference('UserBoard.count', -1) do
      delete user_board_url(@user_board)
    end

    assert_redirected_to user_boards_url
  end
end
