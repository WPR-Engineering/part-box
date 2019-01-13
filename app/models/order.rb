class Order < ApplicationRecord
  has_many :line_item
  has_many :consumables, through: :line_item

  accepts_nested_attributes_for :line_item
  accepts_nested_attributes_for :consumables

end
