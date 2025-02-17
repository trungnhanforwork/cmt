class Brand < ApplicationRecord
  has_many :certificates
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :normalize_attributes

  private

  def normalize_attributes
    self.name = name.strip if name.present?
  end
end
