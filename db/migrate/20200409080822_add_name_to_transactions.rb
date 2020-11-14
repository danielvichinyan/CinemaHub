class AddNameToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :name, :string
    add_column :transactions, :website, :string
  end
end
