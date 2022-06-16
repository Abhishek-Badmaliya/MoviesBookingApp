class Movie < ApplicationRecord
  validates :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_country, :movie_generation, :movie_rating, presence: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  belongs_to :category
end
