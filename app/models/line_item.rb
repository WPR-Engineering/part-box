class LineItem < ApplicationRecord
  attr_accessor :consumable_id, :order_attributes
  belongs_to :consumable
  belongs_to :order
end
