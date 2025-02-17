# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  ip_address :string
#  user_agent :string
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#

class Session < ApplicationRecord
  belongs_to :user
  before_create :generate_token

  private

  def generate_token
    payload = {
      user_id: user.id,
      user_type: user.user_type,
      exp: 7.days.from_now.to_i
    }

    secret_key = Rails.application.credentials.secret_key_base
    self.token = JWT.encode(payload, secret_key, 'HS256')
  end
end
