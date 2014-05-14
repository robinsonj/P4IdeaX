require 'spec_helper'

describe Admin::CurrentsController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:current) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:current, title: nil) }
  let(:valid_session) { { 'warden.user.user.key' => session['warden.user.user.key'] } }
  let(:invalid_session) { {} }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    @user.admin = true
    sign_in @user
  end

  describe "GET 'index'" do
    it 'assigns all currents as @currents' do
      current = create(:current, owner_id: @user.id)
      get :index, {}, valid_session
      expect(assigns(:currents)).to eq([current])
    end
  end

  describe "GET 'edit'" do
    it 'assigns the requested current as @current' do
      current = create(:current, owner_id: @user.id)
      get :edit, { id: current.to_param }, valid_session
      expect(assigns(:current)).to eq(current)
    end
  end

  describe "POST 'create'" do
    describe 'with valid params' do
      it 'creates a new Current' do
        expect {
          post :create, { current: valid_attributes }, valid_session
        }.to change(Current, :count).by(1)
      end

      it 'assigns a newly created current as @current' do
        post :create, { current: valid_attributes }, valid_session
        expect(assigns(:current)).to be_a(Current)
        expect(assigns(:current)).to be_persisted
      end

      it 'redirects to the created redirects to the created current\'s \'admin/edit\'' do
        post :create, { current: valid_attributes }, valid_session
        expect(response).to redirect_to(edit_admin_current_path(Current.last))
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved current as @current' do
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        post :create, { current: invalid_attributes }, valid_session
        expect(assigns(:current)).to be_a_new(Current)
      end

      it "re-renders the 'index' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        post :create, { current: invalid_attributes }, valid_session
        expect(response).to render_template('index')
      end
    end
  end

  describe "PATCH 'update'" do
    describe 'with valid params' do
      it 'updates the requested current' do
        current = create(:current, owner_id: @user.id)
        # Assuming there are no other currents in the database, this
        # specifies that the Current created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Current.any_instance.should_receive(:update).with({ 'title' => 'New Title' })
        patch :update, { id: current.to_param, current: { 'title' => 'New Title' } }, valid_session
      end

      it 'assigns the requested current as @current' do
        current = create(:current, owner_id: @user.id)
        patch :update, { id: current.to_param, current: valid_attributes }, valid_session
        expect(assigns(:current)).to eq(current)
      end

      it 'redirects to the current' do
        current = create(:current, owner_id: @user.id)
        patch :update, { id: current.to_param, current: valid_attributes }, valid_session
        expect(response).to redirect_to(edit_admin_current_path(current))
      end
    end

    describe 'with invalid params' do
      it 'assigns the current as @current' do
        current = create(:current, owner_id: @user.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        patch :update, { id: current.to_param, current: invalid_attributes }, valid_session
        expect(assigns(:current)).to eq(current)
      end

      it "re-renders the 'edit' template" do
        current = create(:current, owner_id: @user.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Current.any_instance.stub(:save).and_return(false)
        patch :update, { id: current.to_param, current: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE 'destroy'" do
    it 'destroys the requested current' do
      current = create(:current, owner_id: @user.id)
      expect {
        delete :destroy, { id: current.to_param }, valid_session
      }.to change(Current, :count).by(-1)
    end

    it 'redirects to the admins\' currents list' do
      current = create(:current, owner_id: @user.id)
      delete :destroy, { id: current.to_param }, valid_session
      expect(response).to redirect_to(admin_currents_url)
    end
  end

end
