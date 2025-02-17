class SubgroupSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :description, :created_at, :updated_at

  has_many :product_groups, serializer: ProductGroupSerializer
end
