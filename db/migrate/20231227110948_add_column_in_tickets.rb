class AddColumnInTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :availability, :integer
  end
end
