require 'spec_helper'

describe "IdeaRequests" do
  before do
    @user = create(:user)
    @user.confirm!
    @idea1 = create(:idea, :owner => @user)
    @idea2 = create(:idea, :owner => @user)
  end

  describe "GET /ideas" do
    it "should return http success" do
      get ideas_path
      expect(response).to be_success
    end
  end

  describe "GET /ideas/new" do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it "should return http success" do
      get new_idea_path
      expect(response).to be_success
    end
  end

  describe "GET /ideas/:id/edit" do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it "should return http success" do
      get edit_idea_path(:id => @idea1.slug)
      expect(response).to be_success
    end
  end

  describe "GET /ideas/:id" do
    it "should return http success" do
      get idea_path(:id => @idea2.id)
      expect(response).to be_success
    end
  end

  describe "GET /ideas/search" do
    it "should return http success" do
      get search_ideas_path(:search_text => 'example text')
      expect(response).to be_success
    end
  end

  pending "POST /ideas"
  pending "PATCH /ideas/:id"
  pending "PUT /ideas/:id"
  pending "DELETE /ideas/:id"
end
