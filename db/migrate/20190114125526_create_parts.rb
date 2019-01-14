class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :internal_part
      t.string :mfg_part
      t.text :name
      t.text :description
      t.string :manufacturer

      t.timestamps
    end
  end
end
