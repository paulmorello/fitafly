class Event < ApplicationRecord
  belongs_to :users, optional: true

  has_many :registrations, :dependent => :destroy
  has_many :users, :through => :registrations



end
