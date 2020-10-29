class Location < ApplicationRecord
  has_many :asset_tags
  has_many :consumables, through: :asset_tags
  accepts_nested_attributes_for :consumables
  has_paper_trail
end
