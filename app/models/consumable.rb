class Consumable < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

  has_one :asset_tag
  has_one :location, through: :asset_tag
  ccepts_nested_attributes_for :location
end
