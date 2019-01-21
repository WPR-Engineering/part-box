class Part < ApplicationRecord
  has_many :consumables
  searchkick
end
