class AddStockRemovedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :removed_stock, :boolean
  end
end
