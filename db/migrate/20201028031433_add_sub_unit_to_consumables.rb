class AddSubUnitToConsumables < ActiveRecord::Migration[5.2]
  def change
    add_column :consumables, :sub_unit, :string
    add_column :consumables, :sub_unit_quantity, :integer

  end
end
