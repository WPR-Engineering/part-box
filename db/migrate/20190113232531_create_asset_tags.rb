class CreateAssetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_tags do |t|
      t.string :tag
      t.references :consumable, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
