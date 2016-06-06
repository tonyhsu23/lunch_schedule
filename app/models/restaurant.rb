class Restaurant < ActiveRecord::Base
  has_many :events
  has_many :dishes
  belongs_to :restaurant_category
end
