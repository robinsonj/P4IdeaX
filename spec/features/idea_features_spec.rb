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

  describe "Show an existing idea" do
    before do
      @idea1 = create(:idea, id: 1)
    end

    it "should show an idea's title and description" do
      visit idea_path(id: 1)

      expect(page).to have_content @idea1.title
      expect(page).to have_content @idea1.description
    end
  end
end
