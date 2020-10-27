class ItemTag < ApplicationRecord
  belongs_to :consumable
  has_paper_trail
end
