class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :cert_type_code, :brand, :products, :subgroups, :cert_date, :created_at, :updated_at
  
  def cert_type_code
    object.cert_type.code
  end

  def brand
    {
      id: object.brand.id,
      name: object.brand.name
    }
  end

  def products
    value = object.read_attribute(:products)
    value.is_a?(String) ? JSON.parse(value) : value
  end
end