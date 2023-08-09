require "rails_helper"

RSpec.describe GroupClothesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/group_clothes").to route_to("group_clothes#index")
    end

    it "routes to #new" do
      expect(get: "/group_clothes/new").to route_to("group_clothes#new")
    end

    it "routes to #show" do
      expect(get: "/group_clothes/1").to route_to("group_clothes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/group_clothes/1/edit").to route_to("group_clothes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/group_clothes").to route_to("group_clothes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/group_clothes/1").to route_to("group_clothes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/group_clothes/1").to route_to("group_clothes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/group_clothes/1").to route_to("group_clothes#destroy", id: "1")
    end
  end
end
