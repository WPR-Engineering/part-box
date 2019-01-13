class AssetTag < ApplicationRecord
  belongs_to :consumable
  belongs_to :location
end
