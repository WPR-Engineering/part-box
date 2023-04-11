class AddPartTypeToParts < ActiveRecord::Migration[7.0]
  def change
    add_column :parts, :part_type, :string
  end
end
