class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :brand_name, :products, :cert_date, :created_at, :updated_at
  def products
    value = object.read_attribute(:products)
    value.is_a?(String) ? JSON.parse(value) : value
  end
  has_many :subgroups
  has_many :product_groups
end

