class Location < ApplicationRecord
  has_many :asset_tags
  has_many :consumables, through: :asset_tag
  accepts_nested_attributes_for :consumables
end
