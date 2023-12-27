class Event < ApplicationRecord
  belongs_to :user
  # belongs_to :event_organizer, class_name: 'User', foreign_key: 'event_organizer_id'
  has_many :tickets, dependent: :destroy
end