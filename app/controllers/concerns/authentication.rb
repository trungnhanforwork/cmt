module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    @current_user.present?
  end

  def require_authentication
    @current_user = find_user_by_jwt || request_authentication
  end

  def find_user_by_jwt
    token = request.headers['Authorization']&.split&.last
    return if token.blank?

    begin
      secret_key = Rails.application.credentials.secret_key_base
      decoded_token = JWT.decode(token, secret_key, true, algorithm: 'HS256')[0]
      User.find_by(id: decoded_token['user_id'])
    rescue JWT::ExpiredSignature
      render json: { error: 'Token has expired' }, status: :unauthorized
      nil
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
      nil
    end
  end

  def request_authentication
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def start_new_session_for(user)
    payload = {
      user_id: user.id,
      user_type: user.user_type,
      exp: 7.days.from_now.to_i
    }
    secret_key = Rails.application.credentials.secret_key_base
    JWT.encode(payload, secret_key, 'HS256')
  end
end
