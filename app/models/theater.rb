class Theater < ApplicationRecord
  validates :theater_name, :city, :theater_address, presence: true

  has_many :shows
  has_many :movies, through: :shows
end
