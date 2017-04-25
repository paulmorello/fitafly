class RemoveMessageIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :message_id, :integer
  end
end
