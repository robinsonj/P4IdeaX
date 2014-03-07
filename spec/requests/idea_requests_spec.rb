require 'spec_helper'

describe "IdeaRequests" do
  describe "GET /idea_requests" do
    it "works! (now write some real specs)" do
      get idea_requests_index_path
      response.status.should be(200)
    end
  end
end
