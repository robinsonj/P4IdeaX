require 'spec_helper'
require 'faker'

describe "IdeaFeatures" do
  describe "Create new ideas" do
    before do
      @user = create(:user)
      @user.confirm!
    end

    it "should create a new idea" do
      visit new_user_session_path

      fill_in "Email",    :with => "#{@user.email}"
      fill_in "Password", :with => "#{@user.password}"

      click_button "Sign in"

      visit new_idea_path

      title = Faker::Lorem.sentence
      description = Faker::Lorem.paragraph
      tags = "tag1, tag2, tag3, tag4"

      fill_in "new-idea-title",         :with => title
      fill_in "new-idea-description",   :with => description
      fill_in "idea_tag_names",         :with => tags

      click_button "Share my idea"

      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content(tags)
    end
  end

  describe "Show an existing idea" do
    before do
      @idea1 = create(:idea)
    end

    it "should show an idea's title and description" do
      visit idea_path(id: @idea1.id)

      expect(page).to have_content @idea1.title
      expect(page).to have_content @idea1.description
    end
  end
end
