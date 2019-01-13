class Order < ApplicationRecord
  has_many :line_items
  has_many :consumables, through: :line_items

  accepts_nested_attributes_for :line_items

end
