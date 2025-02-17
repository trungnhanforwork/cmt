class HealthController < ApplicationController
  allow_unauthenticated_access
  def show
    render json: { status: 'ok', timestamp: Time.current }
  end
end
