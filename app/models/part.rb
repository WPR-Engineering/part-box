class Part < ApplicationRecord
  has_many :consumables
  
  searchkick
  has_paper_trail
end
