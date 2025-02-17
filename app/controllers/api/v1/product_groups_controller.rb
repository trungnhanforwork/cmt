module Api
  module V1
    class ProductGroupsController < BaseController
      load_and_authorize_resource

      # GET /product_groups
      def index
        formatted_response(data: @product_groups)
      end

      # GET /product_groups/1
      def show
        formatted_response(data: @product_group)
      end

      # POST /product_groups
      def create
        @product_group = ProductGroup.new(product_group_params)

        if @product_group.save
          formatted_response(data: @product_group, status: :created)
        else
          formatted_response(errors: @product_group.errors)
        end
      end

      # PATCH/PUT /product_groups/1
      def update
        if @product_group.update(product_group_params)
          formatted_response(data: @product_group)
        else
          formatted_response(errors: @product_group.errors)
        end
      end

      # DELETE /product_group/1
      def destroy
        @product_group.destroy!
        formatted_response(data: { message: 'Product group deleted successfully' })
      end

      private

      def product_group_params
        params.require(:product_group).permit(:code, :description, :name, :subgroup_id)
      end
    end
  end
end
