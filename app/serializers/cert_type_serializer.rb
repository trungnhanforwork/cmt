class CertTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :code, :created_at, :updated_at
end
