require "application_system_test_case"

class UserBoardsTest < ApplicationSystemTestCase
  setup do
    @user_board = user_boards(:one)
  end

  test "visiting the index" do
    visit user_boards_url
    assert_selector "h1", text: "User Boards"
  end

  test "creating a User board" do
    visit user_boards_url
    click_on "New User Board"

    fill_in "Email", with: @user_board.email
    fill_in "Name", with: @user_board.name
    fill_in "Question", with: @user_board.question
    click_on "Create User board"

    assert_text "User board was successfully created"
    click_on "Back"
  end

  test "updating a User board" do
    visit user_boards_url
    click_on "Edit", match: :first

    fill_in "Email", with: @user_board.email
    fill_in "Name", with: @user_board.name
    fill_in "Question", with: @user_board.question
    click_on "Update User board"

    assert_text "User board was successfully updated"
    click_on "Back"
  end

  test "destroying a User board" do
    visit user_boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User board was successfully destroyed"
  end
end
