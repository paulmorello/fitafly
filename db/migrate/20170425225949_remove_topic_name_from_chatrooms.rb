class RemoveTopicNameFromChatrooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :chatrooms, :topic, :string
  end
end
