require 'spec_helper'

describe "Currents" do
  describe "GET /currents" do
    it "works! (now write some real specs)" do
      get currents_path
      response.status.should be(200)
    end
  end
end
