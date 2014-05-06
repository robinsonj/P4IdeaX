require 'spec_helper'
require 'faker'

describe 'IdeaFeatures' do
  before do
    @user = create(:user)
    @user.confirm!

    @idea1 = create(:idea, owner: @user)
    @idea2 = create(:idea, owner: @user)
    @idea3 = create(:idea, owner: @user)
    @idea4 = create(:idea, owner: @user)

    @tag1 = create(:tag, name: 'tag1')
    @tag2 = create(:tag, name: 'tag2')

    @idea1.tags = [@tag1]
    @idea2.tags = [@tag1]
    @idea3.tags = [@tag1]
    @idea4.tags = [@tag2]
  end

  describe 'Create new ideas' do
    it 'should create a new idea' do
      visit new_user_session_path

      fill_in 'Email',    with: "#{@user.email}"
      fill_in 'Password', with: "#{@user.password}"

      click_button 'Sign in'

      visit new_idea_path

      title = Faker::Lorem.sentence
      description = Faker::Lorem.paragraph
      tags = 'tag1, tag2, tag3, tag4'

      fill_in 'new-idea-title',         with: title
      fill_in 'new-idea-description',   with: description
      fill_in 'idea_tag_names',         with: tags

      click_button 'Share my idea'

      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content('tag1')
      expect(page).to have_content('tag2')
      expect(page).to have_content('tag3')
      expect(page).to have_content('tag4')
    end
  end

  describe 'Show an existing idea' do
    it "should show an idea's title and description" do
      visit idea_path(id: @idea1.id)

      expect(page).to have_content @idea1.title
      expect(page).to have_content @idea1.description
    end
  end
end
