class Show < ApplicationRecord
  validates :show_date, :show_time, presence: true

  belongs_to :movie
  belongs_to :screen
end
