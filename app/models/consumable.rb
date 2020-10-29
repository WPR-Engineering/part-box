class Consumable < ApplicationRecord
  
  belongs_to :part
  has_one :asset_tag
  
  
  
  
  
  
  has_many :line_items
  has_many :orders, through: :line_items
  #accepts_nested_attributes_for :line_items
  
  has_many :item_tags

  
  has_one :location, through: :asset_tag
  #accepts_nested_attributes_for :location



  has_paper_trail
  searchkick
  audited
  has_associated_audits
  
  validates :name, presence: true
  validates :part, presence: true
  validates :quantity, presence: true
end
