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

    it "should return http 'created' (201)" do
      expect(response.status).to eq(201)
    end

    it "should render idea 'show' template" do
      expect(response).to render_template 'ideas/show'
    end
  end

  describe "PATCH 'update'" do
    before(:each) do
      create(:vote, :idea_id => @idea.id, :user_id => @user.id, :value => -1)
      patch 'update', { :id => @idea.id, :value => 1 }
    end

    it "should return http success" do
      expect(response).to be_success
    end

    it "should render idea 'show' template" do
      expect(response).to render_template 'ideas/show'
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      create(:vote, :idea_id => @idea.id, :user_id => @user.id, :value => -1)
      delete 'destroy', { :id => @idea.id }
    end

    it "should return http success" do
      expect(response).to be_success
    end

    it "should render idea 'show' template" do
      expect(response).to render_template 'ideas/show'
    end
  end
end
