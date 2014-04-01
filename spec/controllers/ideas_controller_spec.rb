require 'spec_helper'

describe IdeasController do
  before do
    @idea = create(:idea)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', { id: 1 }
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', { id: @idea.id }
      expect(response).to be_success
    end
  end

  pending "POST create"
  pending "PATCH update"
  pending "PUT update"
  pending "DELETE destroy"
end
