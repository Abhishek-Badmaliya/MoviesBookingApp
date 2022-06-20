class Seat < ApplicationRecord
  validates :no_of_seats

  has_many :bookings
  belongs_to :screen
end
