class Event < ActiveRecord::Base
  belongs_to :restaurant
  has_many :users, through: :event_people
  has_many :event_people, dependent: :destroy
  has_many :dishes, through: :event_dishes
  has_many :event_dishes, dependent: :destroy

  def self.dashboard(user)
    colleagues = User.colleagues(user.company_id)
    joins(:users).where(event_people: { user_id: colleagues }).distinct
  end

  def add_participants(participants)
    users << participants
  end

  def add_dishes(our_dishes)
    dishes << our_dishes
  end
end
