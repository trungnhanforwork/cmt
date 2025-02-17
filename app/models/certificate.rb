class Certificate < ApplicationRecord
  belongs_to :cert_type
  belongs_to :brand
  delegate :name, to: :brand, prefix: true

  has_many :certificate_subgroups, dependent: :destroy
  has_many :subgroups, through: :certificate_subgroups
  has_many :product_groups, through: :subgroups

  has_many_attached :images

  validates :cert_number, presence: true, uniqueness: true
  validates :cert_date, presence: true
end
