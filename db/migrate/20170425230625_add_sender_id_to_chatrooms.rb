class AddSenderIdToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :sender_id, :integer
  end
end
