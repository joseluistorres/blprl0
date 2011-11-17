require "spec_helper"

describe MinutesController do
  describe "routing" do

    it "routes to #index" do
      get("/minutes").should route_to("minutes#index")
    end

    it "routes to #new" do
      get("/minutes/new").should route_to("minutes#new")
    end

    it "routes to #show" do
      get("/minutes/1").should route_to("minutes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/minutes/1/edit").should route_to("minutes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/minutes").should route_to("minutes#create")
    end

    it "routes to #update" do
      put("/minutes/1").should route_to("minutes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/minutes/1").should route_to("minutes#destroy", :id => "1")
    end

  end
end
