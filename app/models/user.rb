class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :tickets
  has_many :bookings

  enum user_type: { event_organizer: 1, customer: 2 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  def customer?
    user_type == 'customer'
  end

  def event_organizer?
    user_type == 'event_organizer'
  end
end
