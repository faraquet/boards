json.extract! user_board, :id, :name, :email, :question, :created_at, :updated_at
json.url user_board_url(user_board, format: :json)
