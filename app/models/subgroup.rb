# == Schema Information
#
# Table name: subgroups
#
#  id          :integer          not null, primary key
#  name        :string
#  code        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_subgroups_on_code  (code) UNIQUE
#

class Subgroup < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  has_many :product_groups, dependent: :destroy
  has_many :certificate_subgroups, dependent: :destroy
  has_many :certificates, through: :certificate_subgroups
end
