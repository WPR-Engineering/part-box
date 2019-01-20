class AddSerialNumbberToFixedAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_assets, :serial_number, :string
  end
end
