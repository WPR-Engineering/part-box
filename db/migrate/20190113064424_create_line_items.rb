class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :consumable, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
