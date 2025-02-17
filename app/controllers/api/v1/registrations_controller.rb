module Api
  module V1
    class RegistrationsController < ApplicationController
      allow_unauthenticated_access

      def create
        @user = User.new(user_params)
        if @user.save
          token = start_new_session_for(@user)
          render json: { data: { token: token } }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email_address, :password, :password_confirmation)
      end
    end
  end
end
