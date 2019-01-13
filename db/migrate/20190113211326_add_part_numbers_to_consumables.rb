class AddPartNumbersToConsumables < ActiveRecord::Migration[5.2]
  def change
    add_column :consumables, :part_number, :string
    add_column :consumables, :mfg_part_number, :string
  end
end
