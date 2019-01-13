class Consumable < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

end
