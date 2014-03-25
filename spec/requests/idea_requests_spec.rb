require 'spec_helper'

describe "IdeaRequests" do
  before do
    @idea1 = create(:idea)
    @idea2 = create(:idea)
  end

  describe "GET /ideas" do
    it "should return http success" do
      get ideas_path
      expect(response).to be_success
    end
  end

  describe "GET /ideas/new" do
    before do
      @user = create(:user)
      @user.confirm!
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it "should return http success" do
      get new_idea_path
      expect(response).to be_success
    end
  end

  describe "GET /ideas/:id/edit" do
    it "should return http success" do
      get edit_idea_path(:id => @idea1.id)
      expect(response).to be_success
    end
  end

  describe "GET /ideas/:id" do
    it "should return http success" do
      get idea_path(:id => @idea2.id)
      expect(response).to be_success
    end
  end

  pending "needs expanded GET, POST, PATCH, PUT, DESTROY tests"
  describe "POST /ideas/search" do
    it "should return http success" do
      post search_ideas_path(:search => ['tag', 'tag1'])
      expect(response).to be_success
    end
  end
end
