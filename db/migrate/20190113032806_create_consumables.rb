class CreateConsumables < ActiveRecord::Migration[5.2]
  def change
    create_table :consumables do |t|
      t.string :tag
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :reorderAmount
      t.string :location
      t.string :shelf
      t.string :bin
      t.boolean :obsolete

      t.timestamps
    end
  end
end
