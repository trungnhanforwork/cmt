# == Schema Information
#
# Table name: certificate_subgroups
#
#  id             :integer          not null, primary key
#  certificate_id :integer
#  subgroup_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_certificate_subgroups_on_certificate_id  (certificate_id)
#  index_certificate_subgroups_on_subgroup_id     (subgroup_id)
#

FactoryBot.define do
  factory :certificate_subgroup do
    
  end
end
