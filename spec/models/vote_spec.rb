require 'spec_helper'

describe Vote do
  describe 'New Votes' do

    before do
      @user = create(:user)
      @idea = create(:idea)
    end

    it 'should create new valid votes' do
      vote = create(:vote, idea_id: @idea.id, user_id: @user.id)
      expect(vote).to be_valid
    end

    it 'should not create duplicate votes' do
      vote1 = create(:vote, idea_id: @idea.id, user_id: @user.id)
      vote2 =  build(:vote, idea_id: @idea.id, user_id: @user.id)
      expect(vote2).not_to be_valid
    end

    it 'should not create a vote with no user_id' do
      vote = build(:vote, idea_id: @idea.id)
      expect(vote).not_to be_valid
    end

    it 'should not create a vote with no idea_id' do
      vote = build(:vote, user_id: @user.id)
      expect(vote).not_to be_valid
    end
  end
end
