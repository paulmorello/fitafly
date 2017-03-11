class Event < ApplicationRecord
  belongs_to :users, optional: true
  has_many :registrations

end
