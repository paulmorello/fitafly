class AddUserIdToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :user_id, :integer
  end
end
