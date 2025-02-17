require "rails_helper"

RSpec.describe CertificateSubgroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/certificate_subgroups").to route_to("certificate_subgroups#index")
    end

    it "routes to #show" do
      expect(get: "/certificate_subgroups/1").to route_to("certificate_subgroups#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/certificate_subgroups").to route_to("certificate_subgroups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/certificate_subgroups/1").to route_to("certificate_subgroups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/certificate_subgroups/1").to route_to("certificate_subgroups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/certificate_subgroups/1").to route_to("certificate_subgroups#destroy", id: "1")
    end
  end
end
