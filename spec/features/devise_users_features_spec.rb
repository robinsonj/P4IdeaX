require 'spec_helper'

describe 'UsersFeatures' do

  before do
    @user1  = create(:user, name: 'test1', email: 'test1@test.com',  password: 'testtest')
    @user2  = create(:user, name: 'test2', email: 'test2@test.com',  password: 'testtest')

    @user2.confirm!
  end

  describe 'devise creates a new user' do
    it 'has welcome message after devise/registrations#new with valid credentials' do
      visit new_user_registration_path

      fill_in 'Name',                   with: 'test'
      fill_in 'Email',                  with: 'test@test.com'
      fill_in 'Password',               with: 'testtest'
      fill_in 'Password confirmation',  with: 'testtest'
      check 'user_terms_of_use'

      click_button 'Sign up'

      expect(page).to have_content("A message with a confirmation \
              link has been sent to your email address. Please open \
              the link to activate your account.")
    end

    it 'has error message after devise/registrations#new with invalid credentials' do
      visit new_user_registration_path

      fill_in 'Email',                 with: 'test1@test.com'
      fill_in 'Password',              with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      check 'user_terms_of_use'

      click_button 'Sign up'

      expect(page).to have_content('errors prohibited this user from being saved')
    end
  end

  describe 'devise authenticates valid user' do
    it 'has sign in message after devise/sessions#new with valid credentials' do

      visit new_user_session_path

      fill_in 'Email',    with: "#{@user2.email}"
      fill_in 'Password', with: "#{@user2.password}"

      click_button 'Sign in'

      expect(page).to have_content('Signed in successfully.')
    end

    it 'does not have succesful login message after devise/sessions#new with invalid email' do

      visit new_user_session_path

      fill_in 'Email',    with: 'test10@test.com'
      fill_in 'Password', with: 'testtest'

      click_button 'Sign in'

      # expect(page).to have_content("error_message")
      expect(page).not_to have_content('Signed in successfully.')
    end

    it 'does not have succesful login message after devise/sessions#new with invalid password' do

      visit new_user_session_path

      fill_in 'Email',    with: 'test2@test.com'
      fill_in 'Password', with: 'test2test'

      click_button 'Sign in'

      # expect(page).to have_content("error_message")
      expect(page).not_to have_content('Signed in successfully.')
    end
  end
end
