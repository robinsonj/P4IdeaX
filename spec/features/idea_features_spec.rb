require 'spec_helper'
require 'faker'

describe "IdeaFeatures" do
  describe "Creating new ideas" do
    it "should create a new idea" do
      visit new_idea_path

      fill_in "new-idea-title",         :with => Faker::Lorem.sentence
      fill_in "new-idea-description",   :with => Faker::Lorem.paragraph

      click_button "Share my idea"

      # expect(page).to have_content("")
    end
  end
end
