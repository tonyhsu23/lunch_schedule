class Dish < ActiveRecord::Base
  belongs_to :dish_category
  belongs_to :restaurant

  validates :name, :price, presence: true
  validates :dish_category, presence: true
end
