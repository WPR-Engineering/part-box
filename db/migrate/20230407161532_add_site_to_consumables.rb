class AddSiteToConsumables < ActiveRecord::Migration[7.0]
  def change
    add_column :consumables, :site, :string
  end
end
