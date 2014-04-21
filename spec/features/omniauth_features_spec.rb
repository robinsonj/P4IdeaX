require 'spec_helper'

describe "Omniauth Users" do

  describe "Twitter Auth" do

    it "signs in with valid twitter credentials" do
      visit new_user_session_path
      mock_auth_hash(:twitter)
      click_link "Sign in with Twitter"

      expect(page).to have_content("Successfully authenticated from Twitter account.")
    end
  end

  describe "Facebook Auth" do

    it "signs in with valid facebook credentials" do
      visit new_user_session_path
      mock_auth_hash(:facebook)
      click_link "Sign in with Facebook"

      expect(page).to have_content("Successfully authenticated from Facebook account.")
    end
  end

  it "does not sign in with invalid credentials" do
    visit new_user_session_path
    mock_invalid_credentials(:twitter)
    click_link "Sign in with Twitter"

    expect(page).to have_content("Sign in")
  end
end
