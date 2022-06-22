class Movie < ApplicationRecord
  validates :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_country, :movie_category, :movie_rating, presence: true

  enum :movie_category, [:action, :thrill, :comdey, :scifi]

  has_one_attached :image

  has_many :shows , through: :theater
  has_many :theaters
  has_many :bookings
end
