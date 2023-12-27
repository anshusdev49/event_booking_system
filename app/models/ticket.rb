class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  enum ticket_type: { general_admission: 1, vip: 2 }
end