class FixedAsset < ApplicationRecord
  belongs_to :part
  has_one :asset_tag
  has_one :location, through: :asset_tag
  accepts_nested_attributes_for :location
  validates :part_id, presence: true
  searchkick
end
