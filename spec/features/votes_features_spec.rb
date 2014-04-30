require 'spec_helper'

describe "VoteFeatures" do
  before do
    @user = create(:user)
    @user.confirm!

    @idea = create(:idea, :owner => @user)

    visit new_user_session_path
    fill_in "Email",    :with => "#{@user.email}"
    fill_in "Password", :with => "#{@user.password}"
    click_button "Sign in"
  end

  describe "'Vote Up' button" do
    it "creates a new vote" do
      visit idea_path(@idea)
      click_button "Vote Up"

      expect(page).to have_content("Your vote was saved.")
    end
  end

  describe "Change a vote down" do
    before do
      @vote = create(:vote, :user_id => @user.id, :idea_id => @idea.id, :value => 1)
    end

    it "changes a vote's value" do
      visit idea_path(@idea)
      click_button "Vote Down"

      expect(page).to have_content("Your vote was saved.")
    end
  end

  describe "Change a vote up" do
    before do
      @vote = create(:vote, :user_id => @user.id, :idea_id => @idea.id, :value => -1)
    end

    it "changes a vote's value" do
      visit idea_path(@idea)
      click_button "Vote Up"

      expect(page).to have_content("Your vote was saved.")
    end
  end

  describe "Delete a vote" do
    before do
      @vote = create(:vote, :user_id => @user.id, :idea_id => @idea.id, :value => 1)
    end

    it "changes a vote's value" do
      visit idea_path(@idea)
      click_button "Delete Vote"

      expect(page).to have_content("Your vote was removed.")
    end
  end
end
