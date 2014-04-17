require 'spec_helper'

describe CommentsController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:comment) }
  let(:invalid_attributes_text_nil) { FactoryGirl.attributes_for(:comment, :text => nil) }
  let(:invalid_attributes_text_empty) { FactoryGirl.attributes_for(:comment, :text => "") }

  let(:valid_session) { { "warden.user.user.key" => session["warden.user.user.key"] } }
  let(:invalid_session) { {  } }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    sign_in @user

    @idea = create(:idea, owner_id: @user.id)
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', { :idea_id => @idea.id }
      expect(response).to be_success
    end

    it "assigns a new comment as @comment" do
      get :new, { :idea_id => @idea.id }, valid_session

      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @comment = create(:comment, idea_id: @idea.id, author_id: @user.id)
    end

    it "returns http success" do
      get 'edit', { :idea_id => @idea.id, :id => @comment.id }
      expect(response).to be_success
    end

    it "assigns the requested comment as @comment" do
      get :edit, { :idea_id => @idea.id, :id => @comment.to_param }, valid_session

      expect(assigns(:comment)).to eq(@comment)
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @comment = create(:comment, idea_id: @idea.id, author_id: @user.id)
    end

    it "returns http success" do
      get 'show', { :idea_id => @idea.id, :id => @comment }
      expect(response).to be_success
    end

    it "assigns the requested comment as @comment" do
      get :show, { :idea_id => @idea.id, :id => @comment.to_param }, valid_session
      expect(assigns(:comment)).to eq(@comment)
    end
  end

  describe "POST 'create'" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, { :comment => valid_attributes, :idea_id => @idea.id }, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, { :comment => valid_attributes, :idea_id => @idea.id }, valid_session

        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created comment's idea" do
        post :create, { :comment => valid_attributes, :idea_id => @idea.id }, valid_session

        expect(response).to redirect_to(Comment.last.idea)
      end
    end
  end

  pending "POST 'create' with invalid params"
  pending "PATCH 'update'"
  pending "PUT 'update'"
  pending "DELETE 'destroy'"
end
