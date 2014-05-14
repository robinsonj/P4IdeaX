require 'spec_helper'

describe "Admin::Ideas" do

  before(:all) do
    @user = create(:user)
    @user.confirm!
  end

  describe "GET /admin/ideas" do

    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it "works! (now write some real specs)" do
      get admin_ideas_path
      response.status.should be(200)
    end
  end

  pending "expand Admin Idea request specs #{__FILE__}"
end
