class Theater < ApplicationRecord
  validates :theater_name, :theater_address, presence: true

  has_many :screens
end
