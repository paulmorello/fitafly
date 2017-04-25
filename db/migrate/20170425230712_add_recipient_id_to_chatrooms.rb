class AddRecipientIdToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :recipient_id, :integer
  end
end
