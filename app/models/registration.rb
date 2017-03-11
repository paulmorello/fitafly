class Registration < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :events, optional: true
end
