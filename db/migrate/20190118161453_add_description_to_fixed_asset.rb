class AddDescriptionToFixedAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_assets, :description, :text
  end
end
