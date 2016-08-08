class Restaurant < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :dishes, dependent: :destroy
  belongs_to :restaurant_category

  validates :name, :address, :phone_number, presence: true
  validates_format_of :phone_number, with: /0[2-8]\d{7,8}\z/i
  validates :restaurant_category_id, presence: true
end
