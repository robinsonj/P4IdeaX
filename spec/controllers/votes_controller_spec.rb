require 'spec_helper'

describe VotesController do

  let(:valid_attributes)    { FactoryGirl.attributes_for(:vote) }
  let(:valid_session)       { { 'warden.user.user.key' => session['warden.user.user.key'] } }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    @user = create(:user)
    @idea = create(:idea)
    @user.confirm!

    sign_in @user
  end

  describe "POST 'create'" do
    describe 'with valid params' do
      it 'creates a new Vote' do
        expect do
          post :create, { id: @idea.id, value: valid_attributes[:value] }, valid_session
        end.to change(Vote, :count).by(1)
      end

      it 'assigns a newly created vote as @vote' do
        post :create, { id: @idea.id, value: valid_attributes[:value] }, valid_session

        expect(assigns(:vote)).to be_a(Vote)
        expect(assigns(:vote)).to be_persisted
      end

      it "redirects to the vote's idea" do
        post :create, { id: @idea.id, value: valid_attributes[:value] }, valid_session

        expect(response).to redirect_to(@idea)
      end
    end
  end

  describe "PATCH 'update'" do
    describe 'with valid params' do
      it 'updates the requested vote' do
        vote = create(:vote, idea_id: @idea.id, user_id: @user.id, value: -1)
        # Assuming there are no other votes in the database, this
        # specifies that the vote created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vote.any_instance.should_receive(:update).with(idea_id: @idea.id, user_id: @user.id, value: '1')

        patch :update, { id: @idea.id, value: 1 }, valid_session
      end

      it 'assigns the requested vote as @vote' do
        vote = create(:vote, idea_id: @idea.id, user_id: @user.id, value: -1)
        patch :update, { id: @idea.id, value: 1 }, valid_session

        expect(assigns(:vote)).to eq(vote)
      end

      it "redirects to the vote's idea" do
        vote = create(:vote, idea_id: @idea.id, user_id: @user.id, value: -1)
        patch :update, { id: @idea.id, value: 1 }, valid_session

        expect(response).to redirect_to idea_path(@idea.slug)
      end
    end

    describe 'with invalid params' do
      it 'assigns the vote as @vote' do
        vote = create(:vote, idea_id: @idea.id, user_id: @user.id, value: -1)
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        patch :update, { id: @idea.id, value: 1 }, valid_session

        expect(assigns(:vote)).to eq(vote)
      end

      it "redirects to the vote's idea" do
        vote = create(:vote, idea_id: @idea.id, user_id: @user.id, value: -1)
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        patch :update, { id: @idea.id, value: 1 }, valid_session

        expect(response).to redirect_to idea_path(@idea)
      end
    end
  end

  describe "DELETE 'destroy'" do
    it 'destroys the requested vote' do
      vote = create(:vote, idea_id: @idea.id, user_id: @user.id)
      expect do
        delete 'destroy', { id: @idea.id }, valid_session
      end.to change(Vote, :count).by(-1)
    end

    it "redirects to the vote's idea" do
      vote = create(:vote, idea_id: @idea.id, user_id: @user.id)
      delete :destroy, { id: @idea.id }, valid_session
      expect(response).to redirect_to idea_path(@idea)
    end
  end
end
