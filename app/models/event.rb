class Event < ActiveRecord::Base
  belongs_to :restaurant
  has_many :users, through: :event_people
  has_many :event_people
  has_many :dishes, through: :event_dishes
  has_many :event_dishes

  def self.dashboard(user)
    colleagues = User.colleagues(user.company_id)
    joins(:users).where(event_people: { user_id: colleagues })
  end
end
