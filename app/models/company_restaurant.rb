class CompanyRestaurant < ActiveRecord::Base
  belongs_to :company
  belongs_to :restaurant
end
