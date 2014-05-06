require 'spec_helper'

describe Comment do
  describe 'New Comments' do
    it 'creates comments with valid authors and ideas' do
      idea    = create(:idea)
      author  = create(:user)
      comment = build(:comment, idea_id: idea.id, author_id: author.id)

      comment.should be_valid
    end

    it 'does not create comments with invalid (nonexistent) authors' do
      idea    = create(:idea)
      comment = build(:comment, idea_id: idea.id, author_id: nil)

      comment.should_not be_valid
    end

    it 'does not create comments with invalid (nonexistent) ideas' do
      author  = create(:user)
      comment = build(:comment, idea_id: nil, author_id: author.id)

      comment.should_not be_valid
    end

  end
end
