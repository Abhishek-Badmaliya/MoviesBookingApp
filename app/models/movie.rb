class Movie < ApplicationRecord
  validates :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_country, :movie_generation, :movie_rating, presence: true

  has_one_attached :image

  has_many :shows
  has_many :theaters, through: :shows
end
