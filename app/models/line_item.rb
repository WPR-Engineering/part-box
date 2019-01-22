class LineItem < ApplicationRecord

  belongs_to :consumable
  belongs_to :order
  accepts_nested_attributes_for :consumable
  validates :quantity, presence: true
end
