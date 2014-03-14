require 'spec_helper'
require 'faker'

describe "CommentFeatures" do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
    @idea1 = create(:idea, owner_id: @user1.id)
    @idea2 = create(:idea, owner_id: @user2.id)
    @comment1_1 = create(:comment, idea_id: @idea1.id, author_id: @user1.id)
    @comment1_2 = create(:comment, idea_id: @idea1.id, author_id: @user1.id)
  end

  describe "existing comments" do
    it "shows existing comments" do
      visit idea_path(id: @idea1.id)

      expect(page).to have_content(@comment1_1.text)
      expect(page).to have_content(@comment1_2.text)
    end
  end

  describe "new comments" do
    it "should write and save new comments" do
      visit new_idea_comment_path(idea_id: @idea1.id)
    end
  end
end
