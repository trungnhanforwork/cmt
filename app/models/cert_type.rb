# == Schema Information
#
# Table name: cert_types
#
#  id          :integer          not null, primary key
#  code        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#
# Indexes
#
#  index_cert_types_on_code  (code) UNIQUE
#

class CertType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :certificates
end
