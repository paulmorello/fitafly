
class Chatroom < ApplicationRecord

  belongs_to :sender, :foreign_key => :sender_id, class_name: ‘User’
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: ‘User’

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  # Checks the sender id and the recipient id and checks if a relationship exists between them
  scope :between, -> (sender_id,recipient_id) do
    where(“(chatrooms.sender_id = ? AND chatrooms.recipient_id =?) OR (chatrooms.sender_id = ? AND chatrooms.recipient_id =?)”, sender_id,recipient_id, recipient_id, sender_id)
  end

end
