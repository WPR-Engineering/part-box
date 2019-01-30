class AddPrimaryMacAddressToFixedAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_assets, :primary_mac, :string
  end
end
