class Show < ApplicationRecord
  validates :show_date, :show_time, presence: true

  has_many :bookings
  belongs_to :movie
  belongs_to :theater
end
