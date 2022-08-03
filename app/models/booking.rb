class Booking < ApplicationRecord
  validates :number_of_seats, presence:true

  belongs_to :show
  belongs_to :user
  belongs_to :movie
  belongs_to :theater
  #belongs_to :payment

  after_create :update_show_seats_count

  def update_show_seats_count
    show.update(remaining_seats: show.total_seats - number_of_seats)
  end

   #after_create do
  #   show = Stripe::Product.create(name: @movie.movie_title)
  #   price = Stripe::Price.create(product: show, unit_amount: show_price, currency: "usd")
  #   update(stripe_show_id: show.id, stripe_price_id: price.id)
  # end  
end
