class AddCompletedAtToUserBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :user_boards, :completed_at, :datetime
  end
end
