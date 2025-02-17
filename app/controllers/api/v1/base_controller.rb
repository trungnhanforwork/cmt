# frozen_string_literal: true

module Api
  # The `V1` module contains controllers and logic for version 1 of the API.
  module V1
    class BaseController < ApplicationController
      before_action :set_default_format

      rescue_from StandardError, with: :handle_error
      rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
      rescue_from ActiveRecord::RecordNotUnique, with: :handle_conflict
      rescue_from CanCan::AccessDenied, with: :handle_forbidden

      UNAUTHORIZED_MESSAGE = 'Unauthorized access'
      INVALID_TOKEN_MESSAGE = 'Invalid token'

      private

      def current_user
        @current_user ||= find_current_user
      end

      def json_response(object, status = :ok)
        render json: object, status: status
      end

      def find_current_user
        token = request.headers['Authorization']&.split&.last
        return if token.blank?

        payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256').first
        User.find_by(id: payload['user_id'])
      rescue JWT::DecodeError
        nil
      end

      def set_default_format
        request.format = :json
      end

      def formatted_response(data: nil, errors: {}, status: :ok)
        data = ActiveModelSerializers::SerializableResource.new(data).as_json if data.present?
        render json: { data:, errors: }, status: status
      end

      # Error Handlers
      def handle_error(exception)
        error_response(exception, 'An unexpected error occurred', :internal_server_error)
      end

      def handle_not_found(exception)
        error_response(exception, exception.message, :not_found)
      end

      def handle_validation_error(exception)
        error_response(exception, 'Validation failed', :unprocessable_entity)
      end

      def handle_conflict(exception)
        error_response(exception, 'A conflict occurred while processing this resource', :conflict)
      end

      def handle_forbidden(exception)
        error_response(exception, exception.message, :forbidden)
      end

      def handle_bad_request(exception)
        error_response(exception, exception.message, :bad_request)
      end

      def error_response(exception, message, status)
        response = {
          message:,
          errors: exception.respond_to?(:record) ? exception.record.errors.full_messages : exception.message,
          backtrace: exception.backtrace
        }

        json_response(response, status)
      end
    end
  end
end
