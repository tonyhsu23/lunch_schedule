class Event < ActiveRecord::Base
  belongs_to :restaurant
  has_many :users, through: :event_people
  has_many :event_people, dependent: :destroy
  has_many :dishes, through: :event_dishes
  has_many :event_dishes, dependent: :destroy

  validates :date, presence: true
  validates :restaurant_id, presence: true
  
  def self.dashboard(user)
    colleagues = User.colleagues(user.company_id)
    joins(:users)
    .includes(:restaurant)
    .where(event_people: { user_id: colleagues })
    .distinct
  end

  def self.my_events(user)
    joins(:users)
    .includes(:restaurant)
    .where(event_people: { user_id: user.id })
    .distinct
  end

  def self.my_events_by_rc(user, rc_id)
    if rc_id == 'false'
      my_events(user)
    else
      my_events(user)
      .where(restaurants: { restaurant_category_id: rc_id })
    end
  end

  def add_participants(participants)
    users << participants
  end

  def add_dishes(our_dishes)
    dishes << our_dishes
  end
end
