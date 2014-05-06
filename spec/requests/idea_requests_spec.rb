require 'spec_helper'

describe 'Ideas' do

  let(:valid_attributes) { FactoryGirl.attributes_for(:idea) }

  before do
    @user = create(:user)
    @user.confirm!

    @idea1 = create(:idea, owner: @user)
    @idea2 = create(:idea, owner: @user)
  end

  describe 'GET /ideas' do
    it 'should return http success' do
      get ideas_path
      expect(response).to be_success
    end
  end

  describe 'GET /ideas/new' do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it 'should return http success' do
      get new_idea_path
      expect(response).to be_success
    end
  end

  describe 'GET /ideas/:id/edit' do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it 'should return http success' do
      get edit_idea_path(id: @idea1.slug)
      expect(response).to be_success
    end
  end

  describe 'GET /ideas/:id' do
    it 'should return http success' do
      get idea_path(id: @idea2.id)
      expect(response).to be_success
    end
  end

  describe 'GET /ideas/search' do
    it 'should return http success' do
      get search_ideas_path(search_text: 'example text')
      expect(response).to be_success
    end
  end

  describe 'POST /ideas' do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it 'should return http redirect' do
      post ideas_path, idea: valid_attributes

      expect(response).to redirect_to idea_path(assigns(:idea))
    end
  end

  describe 'PATCH /ideas/:id' do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it 'should return http redirect' do
      idea = create(:idea, owner_id: @user.id)
      patch idea_path(id: idea.id), idea: valid_attributes

      expect(response).to redirect_to idea_path(assigns(:idea))
    end
  end

  describe 'PUT /ideas/:id' do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it 'should return http redirect' do
      idea = create(:idea, owner_id: @user.id)
      put idea_path(id: idea.id), idea: valid_attributes

      expect(response).to redirect_to idea_path(assigns(:idea))
    end
  end

  describe 'DELETE /ideas/:id' do
    before do
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end

    it 'should return http redirect' do
      idea = create(:idea, owner_id: @user.id)
      delete idea_path(id: idea.id)

      expect(response).to redirect_to ideas_url
    end
  end
end
