module Api
  module V1
    class CertificatesController < BaseController
      load_and_authorize_resource

      # GET /certificates
      def index
        formatted_response(data: @certificates)
      end

      # GET /certificates/1
      def show
        formatted_response(data: @certificate)
      end

      # POST /certificates
      def create
        @certificate = Certificate.new(certificate_params)
        @certificate.products = params[:certificate][:products] if params[:certificate][:products].is_a?(Array)
        if @certificate.save
          @certificate.subgroup_ids = params[:certificate][:subgroup_ids] || []
          formatted_response(data: @certificate, status: :created)
        else
          formatted_response(errors: @certificate.errors)
        end
      end

      # PATCH/PUT /certificates/1
      def update
        if @certificate.update(certificate_params)
          formatted_response(data: @certificate)
        else
          formatted_response(errors: @certificate.errors)
        end
      end

      # DELETE /certificates/1
      def destroy
        @certificate.destroy!
        formatted_response(data: { message: 'Certificate deleted successfully' })
      end

      private

      def certificate_params
        params.require(:certificate).permit(:cert_number, :cert_date, :brand_id, :cert_type_id, :subgroup_ids, images: [])
      end
    end
  end
end
