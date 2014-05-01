require 'spec_helper'

describe IdeasController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:idea) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:idea, :title => nil) }
  let(:valid_session) { { "warden.user.user.key" => session["warden.user.user.key"] } }
  let(:invalid_session) { {  } }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    sign_in @user
  end

  describe "GET 'index'" do
    it "assigns all ideas as @ideas" do
      idea = create(:idea, :owner_id => @user.id)
      get :index, {}, valid_session

      expect(assigns(:ideas)).to eq([idea])
    end
  end

  describe "GET 'show'" do
    it "assigns the requested idea as @idea" do
      idea = create(:idea, :owner_id => @user.id)
      get :show, { :id => idea.to_param }, valid_session

      expect(assigns(:idea)).to eq(idea)
    end
  end

  describe "GET 'new'" do
    it "assigns a new idea as @idea" do
      get :new, {}, valid_session

      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe "GET 'edit'" do
    it "assigns the requested idea as @idea" do
      idea = create(:idea, :owner_id => @user.id)
      get :edit, { :id => idea.to_param }, valid_session

      expect(assigns(:idea)).to eq(idea)
    end
  end

  describe "GET 'search'" do
    pending
  end

  describe "POST 'create'" do
    describe "with valid params" do
      it "creates a new Idea" do
        expect {
          post :create, { :idea => valid_attributes }, valid_session
        }.to change(Idea, :count).by(1)
      end

      it "assigns a newly created idea as @idea" do
        post :create, { :idea => valid_attributes }, valid_session

        expect(assigns(:idea)).to be_a(Idea)
        expect(assigns(:idea)).to be_persisted
      end

      it "redirects to the created idea" do
        post :create, { :idea => valid_attributes }, valid_session

        expect(response).to redirect_to(Idea.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved idea as @idea" do
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        post :create, { :idea => invalid_attributes }, valid_session

        expect(assigns(:idea)).to be_a_new(Idea)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        post :create, { :idea => invalid_attributes }, valid_session

        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH 'update'" do
    describe "with valid params" do
      it "updates the requested idea" do
        idea = create(:idea, :owner_id => @user.id)
        # Assuming there are no other currents in the database, this
        # specifies that the idea created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Idea.any_instance.should_receive(:update).with({ "title" => "New Title" })
        patch :update, { :id => idea.to_param, :idea => { "title" => "New Title" } }, valid_session
      end

      it "assigns the requested idea as @idea" do
        idea = create(:idea, :owner_id => @user.id)
        patch :update, { :id => idea.to_param, :idea => valid_attributes }, valid_session
        expect(assigns(:idea)).to eq(idea)
      end

      it "redirects to the idea" do
        idea = create(:idea, :owner_id => @user.id)
        patch :update, { :id => idea.to_param, :idea => valid_attributes }, valid_session
        expect(response).to redirect_to(idea)
      end
    end

    describe "with invalid params" do
      it "assigns the idea as @idea" do
        idea = create(:idea, :owner_id => @user.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        patch :update, { :id => idea.to_param, :idea => invalid_attributes }, valid_session
        expect(assigns(:idea)).to eq(idea)
      end

      it "re-renders the 'edit' template" do
        idea = create(:idea, :owner_id => @user.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        patch :update, { :id => idea.to_param, :idea => invalid_attributes }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE 'destroy'" do
    it "destroys the requested idea" do
      idea = create(:idea, :owner_id => @user.id)
      expect {
        delete :destroy, { :id => idea.to_param }, valid_session
      }.to change(Idea, :count).by(-1)
    end

    it "redirects to the currents list" do
      idea = create(:idea, :owner_id => @user.id)
      delete :destroy, { :id => idea.to_param }, valid_session
      expect(response).to redirect_to(ideas_url)
    end
  end

end
