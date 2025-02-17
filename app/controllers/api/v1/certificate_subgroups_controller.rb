module Api
  module V1
    class CertificateSubgroupsController < BaseController
      load_and_authorize_resource

      # GET /subgroups
      def index
        formatted_response(data: @certificate_subgroups)
      end

      # GET /subgroups/1
      def show
        formatted_response(data: @certificate_subgroup)
      end

      # POST /subgroups
      def create
        @certificate_subgroup = CertificateSubgroup.new(certificate_subgroup_params)

        if @certificate_subgroup.save
          formatted_response(data: @certificate_subgroup, status: :created)
        else
          formatted_response(errors: @subgroup.errors)
        end
      end

      # PATCH/PUT /subgroup/1
      def update
        if @certificate_subgroup.update(certificate_subgroup_params)
          formatted_response(data: @certificate_subgroup)
        else
          formatted_response(errors: @certificate_subgroup.errors)
        end
      end

      # DELETE /subgroups/1
      def destroy
        @certificate_subgroup.destroy!
        formatted_response(data: { message: 'certificate subgroup deleted successfully' })
      end

      private

      def certificate_subgroup_params
        params.require(:certificate_subgroup).permit(:certificate_id, :subgroup_id)
      end
    end
  end
end
