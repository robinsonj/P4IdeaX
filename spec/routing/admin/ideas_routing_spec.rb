require "spec_helper"

describe Admin::IdeasController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/ideas").should route_to("admin/ideas#index")
    end

    it "routes to #new" do
      get("/admin/ideas/new").should route_to("admin/ideas#new")
    end

    it "routes to #show" do
      get("/admin/ideas/1").should route_to("admin/ideas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/ideas/1/edit").should route_to("admin/ideas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/ideas").should route_to("admin/ideas#create")
    end

    it "routes to #update" do
      put("/admin/ideas/1").should route_to("admin/ideas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/ideas/1").should route_to("admin/ideas#destroy", :id => "1")
    end

  end
end
