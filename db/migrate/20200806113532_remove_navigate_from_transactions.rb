class RemoveNavigateFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :navigate, :string
  end
end
