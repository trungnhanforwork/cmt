module Api
  module V1
    class SessionsController < ApplicationController
      allow_unauthenticated_access only: %i[create]
      rate_limit to: 10, within: 3.minutes, only: :create, with: lambda {
        render json: { error: 'Too many attempts. Try again later.' }, status: :too_many_requests
      }

      def create
        user = User.find_by(email_address: user_params[:email_address])

        if user&.authenticate(user_params[:password])
          token = start_new_session_for(user)
          render json: { data: { token: token } }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:email_address, :password)
      end
    end
  end
end
