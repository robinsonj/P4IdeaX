require 'spec_helper'

describe TagsController do
  let(:valid_session)   { { 'warden.user.user.key' => session['warden.user.user.key'] } }
  let(:invalid_session) { {} }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    sign_in @user
  end

  describe "GET 'index'" do
    describe 'valid user session' do
      it 'assigns all tags as @tags' do
        tag = create(:tag)
        get :index, {}, valid_session

        expect(assigns(:tags)).to eq([tag])
      end
    end

    describe 'invalid user session' do
      it 'assigns all tags as @tags' do
        tag = create(:tag)
        get :index, {}, invalid_session

        expect(assigns(:tags)).to eq([tag])
      end
    end
  end

  describe "GET 'show'" do
    describe 'valid user session' do
      it 'assigns all tags as @tags' do
        tag = create(:tag)
        get :show, { id: tag.to_param }, valid_session

        expect(assigns(:tag)).to eq(tag)
      end
    end

    describe 'invalid user session' do
      it 'assigns all tags as @tags' do
        tag = create(:tag)
        get :show, { id: tag.to_param }, invalid_session

        expect(assigns(:tag)).to eq(tag)
      end
    end
  end
end
