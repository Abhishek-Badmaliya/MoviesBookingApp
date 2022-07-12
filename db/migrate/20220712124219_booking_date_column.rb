class BookingDateColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :booking_date, :string
    rename_column :bookings, :booking_date, :selected_seats
  end
end
