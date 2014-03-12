require 'spec_helper'

describe Comment do
  describe "New Comments" do
    it "creates comments with valid authors and ideas" do
      create(:idea, id: 1)
      create(:user, id: 1)
      comment = build(:comment)

      comment.should be_valid
    end

    it "does not create comments with invalid authors" do
      create(:idea, id: 1)
      comment = build(:comment)

      comment.should_not be_valid
    end

    it "does not create comments with invalid ideas" do
      create(:user, id: 1)
      comment = build(:comment)

      comment.should_not be_valid
    end

  end
end
