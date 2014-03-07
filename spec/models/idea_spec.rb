require 'spec_helper'

describe Idea do
  describe "New Ideas" do
    it "creates new ideas" do
      idea = create(:idea)

      idea.should be_valid
    end

    it "does not create a duplicate idea" do
      idea = create(:idea)
      idea2 = idea.dup

      idea2.should_not be_valid
    end

    it "does not create an idea with an empty or nil title" do
      idea = build(:idea, title: '')
      idea2 = build(:idea, title: nil)

      idea.should_not be_valid
      idea2.should_not be_valid
    end
  end
end
