class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :event
      t.references :ticket
      t.timestamps
    end
  end
end
