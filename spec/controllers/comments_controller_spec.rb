require 'spec_helper'

describe CommentsController do

  before(:each) do
    @user    = create(:user)
    @idea    = create(:idea)
    @comment = create(:comment)

    @user.confirm!
    sign_in @user
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', { :idea_id => @idea.id }
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', { :idea_id => @idea.id, :id => @comment.id }
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', { :idea_id => @idea.id, :id => @comment.id }
      response.should be_success
    end
  end

  pending "GET expanded tests (templates, instance variable results, etc)"
  pending "POST 'create'"
  pending "PATCH 'update'"
  pending "PUT 'update'"
  pending "DELETE 'destroy'"
end
