require 'spec_helper'

describe VotesController do

  before do
    @idea = create(:idea)
  end

  describe 'POST create_idea_vote' do
    it 'should be routable' do
      expect(post: '/ideas/1/vote').to be_routable
    end

    it 'should route to votes#create' do
      expect(post: '/ideas/1/vote').to route_to(
          controller: 'votes',
          action: 'create',
          id: '1'
        )
    end

    it "should have helper method 'create_idea_vote_path'" do
      expect(post: create_idea_vote_path(id: @idea.id)).to be_routable
    end
  end

  describe 'PATCH change_idea_vote' do
    it 'should be routable' do
      expect(patch: '/ideas/1/vote/update').to be_routable
    end

    it 'should route to votes#update' do
      expect(patch: '/ideas/1/vote/update').to route_to(
          controller: 'votes',
          action: 'update',
          id: '1'
        )
    end

    it "should have helper method 'change_idea_vote_path'" do
      expect(patch: change_idea_vote_path(id: @idea.id)).to be_routable
    end
  end

  describe 'PUT change_idea_vote' do
    it 'should not be routable' do
      expect(put: '/ideas/1/vote/update').not_to be_routable
    end
  end

  describe 'DELETE remove_idea_vote' do
    it 'should be routable' do
      expect(delete: '/ideas/1/vote/remove').to be_routable
    end

    it 'should route to votes#destroy' do
      expect(delete: '/ideas/1/vote/remove').to route_to(
          controller: 'votes',
          action: 'destroy',
          id: '1'
        )
    end

    it "should have helper method 'remove_idea_vote_path'" do
      expect(delete: remove_idea_vote_path(id: @idea.id)).to be_routable
    end
  end
end
