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

FactoryBot.define do
  factory :subgroup do
    
  end
end
