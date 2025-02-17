class ProductGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :description, :subgroup_id, :created_at, :updated_at
end
