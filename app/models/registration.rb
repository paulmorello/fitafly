class Registration < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :events, optional: true

  before_create :user_cant_register_for_own_event

  # Make sure that one user cannot join the same event more than once at a time.
  validates :event_id, :uniqueness => { :scope => :user_id }

  validates :event_id, :user_id, presence: true

  private
    def user_cant_register_for_own_event
      if :event_id == :user_id
        false
      end
      true
    end
end
