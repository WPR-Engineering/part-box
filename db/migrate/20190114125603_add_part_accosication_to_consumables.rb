class AddPartAccosicationToConsumables < ActiveRecord::Migration[5.2]
  def change
    add_reference :consumables, :part, foreign_key: true
  end
end
