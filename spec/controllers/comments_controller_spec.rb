require 'spec_helper'

describe CommentsController do

  before do
    @user    = create(:user)
    @idea    = create(:idea)
    @comment = create(:comment)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', { :idea_id => @idea.id }
      response.should be_success
    end
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

  pending "needs expanded GET, POST, PATCH, PUT, DESTROY tests"
end
