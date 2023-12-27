class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :price
      t.integer :ticket_type
      t.timestamps
    end
    add_reference :tickets, :event, null: false
  end
end
