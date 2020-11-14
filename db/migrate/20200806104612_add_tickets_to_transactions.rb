class AddTicketsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :tickets, :string
  end
end
