require 'spec_helper'

describe "IdeaRequests" do
  describe "GET /tags" do
    it "returns http success" do
      get tags_path
      expect(response).to be_success
    end
  end
end

