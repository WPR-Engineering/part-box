class AssetTag < ApplicationRecord
  belongs_to :consumable, dependent: :destroy
  belongs_to :location
  belongs_to :fixed_asset, dependent: :destroy
  

  searchkick index_name: "taggles"

  audited associated_with: :fixed_asset
  audited associated_with: :consumable
  has_paper_trail
end
