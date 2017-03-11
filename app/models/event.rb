class Event < ApplicationRecord
  belongs_to :users, optional: true

end
