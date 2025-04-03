class Certificate < ApplicationRecord
  belongs_to :cert_type
  belongs_to :brand
  delegate :name, to: :brand, prefix: true

  has_many_attached :images
  has_and_belongs_to_many :subgroups

  validates :cert_number, presence: true, uniqueness: true
  validates :cert_date, presence: true

  def subgroup_ids=(ids)
    self.subgroups = Subgroup.where(id: ids)
  end
end
