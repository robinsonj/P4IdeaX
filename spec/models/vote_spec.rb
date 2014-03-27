require 'spec_helper'

describe Vote do
  describe "New Votes" do
    it "should create new valid votes" do
      user = create(:user)
      idea = create(:idea)
      vote = create(:vote, idea_id: idea.id, user_id: user.id)

      puts user.inspect
      puts idea.inspect
      puts vote.inspect

      expect(vote).to be_valid
    end
  end
end
