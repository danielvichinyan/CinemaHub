class AddNavigateToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :navigate, :string
  end
end
