class Part < ApplicationRecord
  has_many :consumables

  include PgSearch
  multisearchable :against => [:mfg_part]
end
