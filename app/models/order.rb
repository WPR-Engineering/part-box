class Order < ApplicationRecord
  has_many :line_items
  has_many :consumables, through: :line_items






  accepts_nested_attributes_for :line_items, allow_destroy: true
  accepts_nested_attributes_for :consumables
  
  
  
  
  

  after_save :remove_stock, if: :finalized?

  searchkick
  audited
  has_paper_trail
  has_associated_audits

  def remove_stock
    #TODO Make this decrement the quantity of the consumable in each line item
    puts "********************************** REMOVED STOCK **********************************"
  end
end
