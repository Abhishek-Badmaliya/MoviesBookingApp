class Show < ApplicationRecord
  validates :show_date, :show_time, :total_seats, :show_price, presence: true

  has_many :bookings
  belongs_to :movie
  belongs_to :theater

  # after_create do
  #   show = Stripe::Product.create(name: @movie.movie_title)
  #   price = Stripe::Price.create(product: show, unit_amount: show_price, currency: "usd")
  #   update(stripe_show_id: show.id, stripe_price_id: price.id)
  # end
end
