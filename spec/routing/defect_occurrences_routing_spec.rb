require "spec_helper"

describe DefectOccurrencesController do
  describe "routing" do

    it "routes to #index" do
      get("/defect_occurrences").should route_to("defect_occurrences#index")
    end

    it "routes to #new" do
      get("/defect_occurrences/new").should route_to("defect_occurrences#new")
    end

    it "routes to #show" do
      get("/defect_occurrences/1").should route_to("defect_occurrences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/defect_occurrences/1/edit").should route_to("defect_occurrences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/defect_occurrences").should route_to("defect_occurrences#create")
    end

    it "routes to #update" do
      put("/defect_occurrences/1").should route_to("defect_occurrences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/defect_occurrences/1").should route_to("defect_occurrences#destroy", :id => "1")
    end

  end
end
