# == Schema Information
#
# Table name: subgroups
#
#  id               :integer          not null, primary key
#  name             :string
#  code             :string           not null
#  description      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_group_id :integer          not null
#
# Indexes
#
#  index_subgroups_on_code              (code) UNIQUE
#  index_subgroups_on_product_group_id  (product_group_id)
#

class Subgroup < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  belongs_to :product_group

  has_many :certificate_subgroups, dependent: :destroy
  has_many :certificates, through: :certificate_subgroups
end
