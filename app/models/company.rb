class Company < ActiveRecord::Base
  has_many :departments
  has_many :users

  has_many :company_restaurants, dependent: :destroy
  has_many :restaurants, through: :company_restaurants
end
