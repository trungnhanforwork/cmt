# == Schema Information
#
# Table name: product_groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  code        :string           not null
#  subgroup_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_groups_on_subgroup_id  (subgroup_id)
#

FactoryBot.define do
  factory :product_group do
    
  end
end
