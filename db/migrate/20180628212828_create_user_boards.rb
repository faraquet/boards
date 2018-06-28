class CreateUserBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_boards do |t|
      t.string :name
      t.string :email
      t.text :question

      t.timestamps
    end
  end
end
