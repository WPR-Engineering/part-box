json.extract! consumable, :id, :tag, :name, :description, :quantity, :reorderAmount, :location, :shelf, :bin, :obsolete, :created_at, :updated_at
json.url consumable_url(consumable, format: :json)
