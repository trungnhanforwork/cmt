require "rails_helper"

RSpec.describe ProductGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product_groups").to route_to("product_groups#index")
    end

    it "routes to #show" do
      expect(get: "/product_groups/1").to route_to("product_groups#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product_groups").to route_to("product_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product_groups/1").to route_to("product_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product_groups/1").to route_to("product_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product_groups/1").to route_to("product_groups#destroy", id: "1")
    end
  end
end
