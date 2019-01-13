class AddFinalizationToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :finalized, :boolean
  end
end
