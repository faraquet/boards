class AddAdminEmailToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :admin_email, :string
  end
end
