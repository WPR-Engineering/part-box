class RemoveLocationFromConsumable < ActiveRecord::Migration[5.2]
  def change
    remove_column :consumables, :location, :string
  end
end
