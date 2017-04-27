class Event < ApplicationRecord
  belongs_to :users, optional: true

  has_many :registrations, :dependent => :destroy
  has_many :users, :through => :registrations

  validates :title, :sport, :description, :user_id, :location, :difficulty, :additional_information, :cost, presence: true

  validates :description, :additional_information, length: {
    in: 3..300
  }

  validates :cost, numericality: { greater_than: -1, less_than: 1001 }

end
