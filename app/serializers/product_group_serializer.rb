class ProductGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :description, :created_at, :updated_at
end
