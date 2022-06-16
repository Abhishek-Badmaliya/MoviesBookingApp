class Screen < ApplicationRecord
  validates :screen_name, presence: true

  has_many :seats
  belongs_to :movie
  belongs_to :theater
end
