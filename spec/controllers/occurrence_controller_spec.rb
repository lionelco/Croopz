require 'spec_helper'

describe OccurrenceController do

  describe "GET 'number:integer'" do
    it "returns http success" do
      get 'number:integer'
      response.should be_success
    end
  end

  describe "GET 'description:text'" do
    it "returns http success" do
      get 'description:text'
      response.should be_success
    end
  end

  describe "GET 'defect_id:integer'" do
    it "returns http success" do
      get 'defect_id:integer'
      response.should be_success
    end
  end

  describe "GET 'target_id:integer'" do
    it "returns http success" do
      get 'target_id:integer'
      response.should be_success
    end
  end

  describe "GET 'company_id:integer'" do
    it "returns http success" do
      get 'company_id:integer'
      response.should be_success
    end
  end

  describe "GET 'user_id:integer'" do
    it "returns http success" do
      get 'user_id:integer'
      response.should be_success
    end
  end

end
