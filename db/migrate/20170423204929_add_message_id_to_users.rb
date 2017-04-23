class AddMessageIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :message_id, :integer
  end
end
