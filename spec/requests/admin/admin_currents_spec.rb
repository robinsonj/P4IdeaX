require 'spec_helper'

describe "Admin::Currents" do

  before(:all) do
    @user = create(:user)
    @user.confirm!
  end

  describe "GET /admin/currents" do

    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it "works! (now write some real specs)" do
      get admin_currents_path
      response.status.should be(200)
    end
  end

  pending "expand Admin Current request specs #{__FILE__}"
end
