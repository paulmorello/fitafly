class Registration < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :events, optional: true

  # Make sure that one user cannot join the same event more than once at a time.
  validates :event_id, :uniqueness => { :scope => :user_id }
end
