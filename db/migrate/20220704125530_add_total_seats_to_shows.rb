class AddTotalSeatsToShows < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :total_seats, :integer
  end
end
