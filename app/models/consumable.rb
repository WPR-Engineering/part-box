class Consumable < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

  has_one :asset_tag
  has_one :location, through: :asset_tag
  accepts_nested_attributes_for :location

  belongs_to :part

  searchkick
  audited
  has_associated_audits
  
  validates :name, presence: true
  validates :part, presence: true
  validates :quantity, presence: true
end
