# == Schema Information
#
# Table name: product_groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  code        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductGroup < ApplicationRecord
  has_many :subgroups, dependent: :destroy
  validates :code, presence: true, uniqueness: true
end
