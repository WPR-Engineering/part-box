class AddFixedAssetToAssetTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :asset_tags, :fixed_assets, foreign_key: true
  end
end
