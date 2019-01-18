class CreateFixedAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_assets do |t|
      t.string :InstalledLocation
      t.string :RackUnit
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
