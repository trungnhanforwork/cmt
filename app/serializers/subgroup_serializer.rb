class SubgroupSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :product_group_code

  def product_group_code
    object.product_group.code if object.product_group.present?
  end
end
