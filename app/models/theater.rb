class Theater < ApplicationRecord
  validates :name, :address, presence: true
  belongs_to :movie
end
