class CreateItemTags < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tags do |t|
      t.string :tag_number
      t.integer :container_quantity
      t.boolean :auto_removed
      t.belongs_to :consumable, foreign_key: true

      t.timestamps
    end
  end
end
