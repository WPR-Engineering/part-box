class AddDisposalNoteToFixedAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :fixed_assets, :disposal_note, :text
  end
end

