class AddOverstockToConsumables < ActiveRecord::Migration[7.0]
  def change
    add_column :consumables, :overstock, :boolean
    add_column :consumables, :overstock_quantity, :integer
    add_column :consumables, :overstock_location, :string
    add_column :consumables, :overstock_notes, :text
  end
end
