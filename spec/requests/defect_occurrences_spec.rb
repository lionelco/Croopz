require 'spec_helper'

describe "DefectOccurrences" do
  describe "GET /defect_occurrences" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get defect_occurrences_path
      response.status.should be(200)
    end
  end
end