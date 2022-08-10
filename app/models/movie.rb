class Movie < ApplicationRecord
  validates :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_rating, :category_id, presence: true

  has_one_attached :image

  has_many :shows, dependent: :destroy #, through: :theater
  has_many :theaters, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :category
  belongs_to :theater

  include PgSearch::Model
  pg_search_scope :search_query, against: [:movie_title, :movie_description], using: {tsearch: {prefix: true}}  

  def self.text_search(query)
    if query.present?
      search_query(query)
    else
      scoped
    end
  end
end
