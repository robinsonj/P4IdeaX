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

    it "does not create an idea with an empty title" do
      idea = build(:idea, title: '')

      idea.should_not be_valid
    end

    it "does not create an idea with a nil title" do
      idea = build(:idea, title: nil)

      idea.should_not be_valid
    end
  end
end
