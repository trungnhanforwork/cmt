module Api
  module V1
    class SubgroupsController < BaseController
      load_and_authorize_resource

      # GET /subgroups
      def index
        formatted_response(data: @subgroups)
      end

      # GET /subgroups/1
      def show
        formatted_response(data: @subgroup)
      end

      # POST /subgroups
      def create
        @subgroup = Subgroup.new(subgroup_params)

        if @subgroup.save
          formatted_response(data: @subgroup, status: :created)
        else
          formatted_response(errors: @subgroup.errors)
        end
      end

      # PATCH/PUT /subgroup/1
      def update
        if @subgroup.update(subgroup_params)
          formatted_response(data: @subgroup)
        else
          formatted_response(errors: @subgroup.errors)
        end
      end

      # DELETE /subgroups/1
      def destroy
        @subgroup.destroy!
        formatted_response(data: { message: 'Subgroup deleted successfully' })
      end

      private

      def subgroup_params
        params.require(:subgroup).permit(:name, :code, :description)
      end
    end
  end
end
