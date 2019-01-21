class AssetTag < ApplicationRecord
  belongs_to :consumable
  belongs_to :location
  belongs_to :fixed_asset, dependent: :destroy

  searchkick index_name: "taggles"
end
