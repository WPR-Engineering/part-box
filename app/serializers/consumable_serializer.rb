class ConsumableSerializer < ActiveModel::Serializer   
	attributes :id, :name, :quantity, :reorderAmount, :bin, :shelf
end