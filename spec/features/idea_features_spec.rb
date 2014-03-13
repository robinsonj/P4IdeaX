require 'spec_helper'
require 'faker'

describe "Idea Features" do
  describe "Creating new ideas" do
    it "should create a new idea" do
      visit new_idea_path

      fill_in "Idea", :with => Faker::Lorem.sentence
      fill_in "Description", :with => Faker::Lorem.paragraph
    end
  end
end
