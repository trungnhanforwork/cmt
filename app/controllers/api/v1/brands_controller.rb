module Api
  module V1
    class BrandsController < BaseController
      load_and_authorize_resource

      # GET /brands
      def index
        formatted_response(data: @brands)
      end

      # GET /brands/1
      def show
        formatted_response(data: @brand)
      end

      # POST /brands
      def create
        @brand = Brand.new(brand_params)

        if @brand.save
          formatted_response(data: @brand, status: :created)
        else
          formatted_response(errors: @brand.errors)
        end
      end

      # PATCH/PUT /brands/1
      def update
        if @brand.update(brand_params)
          formatted_response(data: @brand)
        else
          formatted_response(errors: @brand.errors)
        end
      end

      # DELETE /brands/1
      def destroy
        @brand.destroy!
        formatted_response(data: { message: 'Brand deleted successfully' })
      end

      private

      def brand_params
        params.require(:brand).permit(:name, :priority, :description)
      end
    end
  end
end
