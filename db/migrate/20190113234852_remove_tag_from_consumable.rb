class RemoveTagFromConsumable < ActiveRecord::Migration[5.2]
  def change
    remove_column :consumables, :tag, :string
  end
end
