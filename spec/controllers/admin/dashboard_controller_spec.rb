require 'spec_helper'

describe Admin::DashboardController do

  let(:valid_session) { { 'warden.user.user.key' => session['warden.user.user.key'] } }

  before(:each) do

  end

  describe "GET 'index'" do
    # it "returns http success" do
    #   get 'index'
    #   response.should be_success
    # end


  end

  pending "implementation of Admin Dashboard Controller specs #{__FILE__}"
end
