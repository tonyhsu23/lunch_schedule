class Restaurant < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :dishes, dependent: :destroy
  belongs_to :restaurant_category

  validates :name, :address, :phone_number, presence: true
  validates :restaurant_category, presence: true
end
