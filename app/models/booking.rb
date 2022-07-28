class Booking < ApplicationRecord
  validates :booking_date, presence: true

  belongs_to :show
  belongs_to :user
  belongs_to :movie
  belongs_to :theater
end
