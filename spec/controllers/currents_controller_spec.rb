require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CurrentsController do

  # This should return the minimal set of attributes required to create a valid
  # Current. As you add validations to Current, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:current) }

  # Test some actions with invalid attributes.
  let(:invalid_attributes) { FactoryGirl.attributes_for(:current, :title => nil) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CurrentsController. Be sure to keep this updated too.
  let(:valid_session) { { "warden.user.user.key" => session["warden.user.user.key"] } }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    sign_in @user
  end

  describe "GET index" do
    it "assigns all currents as @currents" do
      current = create(:current, :owner_id => @user.id)
      get :index, {}, valid_session

      expect(assigns(:currents)).to eq([current])
    end
  end

  describe "GET show" do
    it "assigns the requested current as @current" do
      current = create(:current, :owner => @user)

      get :show, { :id => current.to_param }, valid_session

      expect(assigns(:current)).to eq(current)
    end
  end

  describe "GET new" do
    it "assigns a new current as @current" do
      get :new, {}, valid_session

      expect(assigns(:current)).to be_a_new(Current)
    end
  end

  describe "GET edit" do
    it "assigns the requested current as @current" do
      current = create(:current, :owner_id => @user.id)
      get :edit, {:id => current.to_param}, valid_session

      expect(assigns(:current)).to eq(current)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Current" do
        expect {
          post :create, { :current => valid_attributes }, valid_session
        }.to change(Current, :count).by(1)
      end

      it "assigns a newly created current as @current" do
        post :create, { :current => valid_attributes }, valid_session

        expect(assigns(:current)).to be_a(Current)
        expect(assigns(:current)).to be_persisted
      end

      it "redirects to the created current" do
        post :create, { :current => valid_attributes }, valid_session

        expect(response).to redirect_to(Current.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved current as @current" do
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        post :create, { :current => invalid_attributes }, valid_session

        expect(assigns(:current)).to be_a_new(Current)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        post :create, { :current => invalid_attributes }, valid_session

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested current" do
        current = create(:current, :owner_id => @user.id)
        # Assuming there are no other currents in the database, this
        # specifies that the Current created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Current.any_instance.should_receive(:update).with({ "title" => "New Title" })
        put :update, { :id => current.to_param, :current => { "title" => "New Title" } }, valid_session
      end

      it "assigns the requested current as @current" do
        current = create(:current, :owner_id => @user.id)
        put :update, {:id => current.to_param, :current => valid_attributes}, valid_session
        expect(assigns(:current)).to eq(current)
      end

      it "redirects to the current" do
        current = create(:current, :owner_id => @user.id)
        put :update, {:id => current.to_param, :current => valid_attributes}, valid_session
        expect(response).to redirect_to(current)
      end
    end

    describe "with invalid params" do
      it "assigns the current as @current" do
        current = create(:current, :owner_id => @user.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        put :update, { :id => current.to_param, :current => invalid_attributes }, valid_session
        expect(assigns(:current)).to eq(current)
      end

      it "re-renders the 'edit' template" do
        current = create(:current, :owner_id => @user.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        put :update, { :id => current.to_param, :current => invalid_attributes }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested current" do
      current = create(:current, :owner_id => @user.id)
      expect {
        delete :destroy, {:id => current.to_param}, valid_session
      }.to change(Current, :count).by(-1)
    end

    it "redirects to the currents list" do
      current = create(:current, :owner_id => @user.id)
      delete :destroy, {:id => current.to_param}, valid_session
      expect(response).to redirect_to(currents_url)
    end
  end

end
