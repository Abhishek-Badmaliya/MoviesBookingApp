class CheckoutController < ApplicationController
  def create
    show = Show.find(params[:id])
    movie = Movie.find(show.movie_id)
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
				name: movie.movie_title,
				amount: show.show_price * 100,
				currency: "usd",
				quantity: 1
			}],
      mode: 'payment',
      success_url: 'root_url',
      cancel_url: 'root_url',
    })
    respond_to do |format|
      format.js
    end
  end
end
