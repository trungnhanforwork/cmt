require "rails_helper"

RSpec.describe SubgroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/subgroups").to route_to("subgroups#index")
    end

    it "routes to #show" do
      expect(get: "/subgroups/1").to route_to("subgroups#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/subgroups").to route_to("subgroups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/subgroups/1").to route_to("subgroups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subgroups/1").to route_to("subgroups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subgroups/1").to route_to("subgroups#destroy", id: "1")
    end
  end
end
