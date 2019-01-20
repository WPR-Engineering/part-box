class AddDisposedToFixedAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_assets, :disposed, :boolean
  end
end
