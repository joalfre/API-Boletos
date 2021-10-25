class AddQuantitiesColumnsToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :quantities, :integer
  end
end
