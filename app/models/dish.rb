class Dish < ActiveRecord::Base
  belongs_to :dish_category
  belongs_to :restaurant

  has_many :dish_images, dependent: :destroy

  validates :name, :price, presence: true
  validates :dish_category, presence: true

  def create_dish_image(image)
    dish_images.create(image: image)
  end
end
