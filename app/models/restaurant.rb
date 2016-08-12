class Restaurant < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :dishes, dependent: :destroy
  belongs_to :restaurant_category

  has_many :company_restaurants, dependent: :destroy
  has_many :companies, through: :company_restaurants

  validates :name, :address, :phone_number, presence: true
  validates_format_of :phone_number, with: /0[2-8]\d{7,8}\z/i
  validates :restaurant_category_id, presence: true

  def self.by_company(company_id)
    joins(:companies)
    .where(company_restaurants: { company_id: company_id })
  end

  def add_company(company)
    companies << company
  end
end
