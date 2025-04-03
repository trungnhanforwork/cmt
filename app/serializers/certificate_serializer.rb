class CertificateSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :cert_type_code, :cert_number, :brand, :products, :subgroups, :cert_date, :created_at, :updated_at,
             :images

  def images
    object.images.map { |image| rails_blob_path(image, only_path: true) }
  end

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

  def subgroups
    object.subgroups.map do |subgroup|
      {
        id: subgroup.id,
        name: subgroup.name,
        code: subgroup.code
      }
    end
  end
end
