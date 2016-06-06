class RestaurantCategory < ActiveRecord::Base
  has_many :restaurant_categories
end
