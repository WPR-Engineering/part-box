class AddPurchasePriceToFixedAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :fixed_assets, :purchase_price, :integer
  end
end
