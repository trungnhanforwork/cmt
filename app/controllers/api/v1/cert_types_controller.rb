module Api
  module V1
    class CertTypesController < BaseController
      load_and_authorize_resource

      # GET /cert_types
      def index
        formatted_response(data: @cert_types)
      end

      # GET /cert_types/1
      def show
        formatted_response(data: @cert_type)
      end

      # POST /cert_types
      def create
        @cert_type = CertType.new(cert_type_params)

        if @cert_type.save
          formatted_response(data: @cert_type, status: :created)
        else
          formatted_response(errors: @cert_type.errors)
        end
      end

      # PATCH/PUT /cert_type/1
      def update
        if @cert_type.update(cert_type_params)
          formatted_response(data: @cert_type)
        else
          formatted_response(errors: @cert_type.errors)
        end
      end

      # DELETE /cert_type/1
      def destroy
        @cert_type.destroy!
        formatted_response(data: { message: 'Certificate type deleted successfully' })
      end

      private

      def cert_type_params
        params.require(:cert_type).permit(:code, :description, :name)
      end
    end
  end
end
