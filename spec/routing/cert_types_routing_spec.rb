require "rails_helper"

RSpec.describe CertTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cert_types").to route_to("cert_types#index")
    end

    it "routes to #show" do
      expect(get: "/cert_types/1").to route_to("cert_types#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cert_types").to route_to("cert_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cert_types/1").to route_to("cert_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cert_types/1").to route_to("cert_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cert_types/1").to route_to("cert_types#destroy", id: "1")
    end
  end
end
