require 'spec_helper'

describe IdeasController do
  before do
    @idea = create(:idea)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', { id: 1 }
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', { id: 1 }
      response.should be_success
    end
  end

  pending "has no POST tests yet"
end
