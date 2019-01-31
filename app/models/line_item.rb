class LineItem < ApplicationRecord

  belongs_to :consumable
  belongs_to :order
  accepts_nested_attributes_for :consumable
  validates :quantity, presence: true

  audited associated_with: :consumable
  audited associated_with: :order
end
