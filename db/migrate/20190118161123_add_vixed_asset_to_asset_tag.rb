class AddVixedAssetToAssetTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :asset_tags, :fixed_asset, foreign_key: true
  end
end
