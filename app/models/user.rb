class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  belongs_to :department
  has_many :events, through: :event_people
  has_many :event_people

  def full_name
    "#{first_name} #{last_name}"
  end

  def chinese_full_name
    "#{chinese_last_name}#{chinese_first_name}"
  end

  def self.colleagues(company_id, user_id)
    where(company_id: company_id)
    .where.not(id: user_id)
  end
end
