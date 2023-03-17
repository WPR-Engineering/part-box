class AddCategoryToConsumables < ActiveRecord::Migration[7.0]
  def change
    add_column :consumables, :category, :string
  end
end
