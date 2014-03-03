require 'spec_helper'

describe "HomeRequests" do
  describe "GET index" do
    it "renders home#index template" do
      get home_index_path
      response.status.should be(200)
    end
  end

  describe "GET about" do
    it "renders home#about template" do
      get home_about_path
      response.status.should be(200)
    end
  end

  describe "GET contact" do
    it "renders home#contact template" do
      get home_contact_path
      response.status.should be(200)
    end
  end
end
