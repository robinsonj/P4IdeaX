require "spec_helper"

describe CurrentsController do
  describe "routing" do

    it "routes to #index" do
      get("/currents").should route_to("currents#index")
    end

    it "routes to #new" do
      get("/currents/new").should route_to("currents#new")
    end

    it "routes to #show" do
      get("/currents/1").should route_to("currents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/currents/1/edit").should route_to("currents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/currents").should route_to("currents#create")
    end

    it "routes to #update" do
      put("/currents/1").should route_to("currents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/currents/1").should route_to("currents#destroy", :id => "1")
    end

  end
end
