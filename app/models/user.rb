class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  belongs_to :department
  has_many :events, through: :event_people
  has_many :event_people

  def self.colleagues(company_id)
    where(company_id: company_id)
    .pluck(:id)
  end
end
