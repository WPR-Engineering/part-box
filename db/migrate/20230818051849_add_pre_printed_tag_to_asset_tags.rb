class AddPrePrintedTagToAssetTags < ActiveRecord::Migration[7.0]
  def change
    add_column :asset_tags, :preprinted_tag, :boolean
  end
end
