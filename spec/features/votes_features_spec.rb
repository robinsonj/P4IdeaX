require 'spec_helper'

describe "VoteFeatures" do
  before(:all) do
    @idea = create(:idea)
    @user = create(:user)
    @user.confirm!
    visit new_user_session_path
    fill_in "Email",    :with => "#{@user.email}"
    fill_in "Password", :with => "#{@user.password}"
    click_button "Sign in"
  end

  before(:each) do
    visit idea_path(@idea)
  end

  describe "Vote on an idea" do
    it "creates a new vote on an idea" do
      # puts Vote.find(@idea.id, @user.id).inspect

      click_link "Vote Up"
      expect(page).to have_content("Your vote was saved")
    end

  #   it "changes a vote's value down" do
  #     puts Vote.find(@idea.id, @user.id).inspect

  #     click_link "Vote Down"
  #     expect(page).to have_content("Your vote was saved")
  #   end

  #   it "changes a vote's value up" do
  #     puts Vote.find(@idea.id, @user.id).inspect

  #     click_link "Vote Up"
  #     expect(page).to have_content("Your vote was saved")
  #   end
  # end

  # describe "Remove a vote on an idea" do

  #   before(:all) do
  #     create(:vote, :user_id => @user.id, :idea_id => @idea.id)
  #   end

  #   it "removes a vote" do
  #     puts Vote.find(@idea.id, @user.id).inspect

  #     click_link "Delete Vote"
  #     expect(page).to have_content("Your vote was removed")
  #   end
  end
end
