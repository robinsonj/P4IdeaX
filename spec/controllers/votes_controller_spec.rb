require 'spec_helper'

describe VotesController do
  before do
    @user = create(:user)
    @idea = create(:idea)

    @user.confirm!
    sign_in @user
  end

  describe "POST 'create'" do
    before(:each) do
      post 'create', { :id => @idea.id, :value => -1 }
    end

    it "should return http 'redirect'" do
      expect(response).to be_redirect
      expect(response).to redirect_to idea_path(@idea.slug)
    end
  end

  describe "PATCH 'update'" do
    before(:each) do
      create(:vote, :idea_id => @idea.id, :user_id => @user.id, :value => -1)
      patch 'update', { :id => @idea.id, :value => 1 }
    end

    it "should return http 'redirect'" do
      expect(response).to be_redirect
      expect(response).to redirect_to idea_path(@idea.slug)
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      create(:vote, :idea_id => @idea.id, :user_id => @user.id, :value => -1)
      delete 'destroy', { :id => @idea.id }
    end

    it "should return http 'redirect'" do
      expect(response).to be_redirect
      expect(response).to redirect_to idea_path(@idea.slug)
    end
  end
end
