class Event < ActiveRecord::Base
  belongs_to :restaurant
  has_many :users, through: :event_people
  has_many :event_people, dependent: :destroy
  has_many :dishes, through: :event_dishes
  has_many :event_dishes, dependent: :destroy

  validates :date, presence: true
  validates :restaurant_id, presence: true

  scope :by_month, ->(date) { where(date: month_duration(date)) }
  scope :by_category, ->(rc_id) { where(restaurants: { restaurant_category_id: rc_id }) }
  
  def self.company_events(user)
    colleagues = User.colleagues(user.company_id, user.id)

    joins(:users)
    .includes(:restaurant)
    .where(event_people: { user_id: colleagues })
    .distinct
  end

  def self.company_events_by_month
    company_events(user).by_month(date)
  end

  def self.company_events_on_condition(user, rc_id, month)
    if rc_id == 'false'
      company_events(user)
      .by_month(month_to_date(month))
    else
      company_events(user)
      .by_category(rc_id)
      .by_month(month_to_date(month))
    end
  end

  def self.my_events(user)
    joins(:users)
    .includes(:restaurant)
    .where(event_people: { user_id: user.id })
    .distinct
  end

  def self.my_events_by_month(user, date)
    my_events(user).by_month(date)
  end

  def self.my_events_on_condition(user, rc_id, month)
    if rc_id == 'false'
      my_events(user)
      .by_month(month_to_date(month))
    else
      my_events(user)
      .by_category(rc_id)
      .by_month(month_to_date(month))
    end
  end

  def self.month_duration(date)
    date.beginning_of_month..date.end_of_month
  end

  def self.month_to_date(month)
    Date.today.change(month: month.to_i)
  end

  def add_participants(participants)
    users << participants
  end

  def add_dishes(our_dishes)
    dishes << our_dishes
  end
end
