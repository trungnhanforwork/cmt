class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  enum :user_type, {
    superadmin: 0,
    admin: 1,
    sales: 2,
    sales_manager: 3,
    customer: 4
  }, prefix: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
