class Booking < ApplicationRecord
  validates :booking_date, presence: true

  has_many :seats
  belongs_to :show
  belongs_to :user
end
