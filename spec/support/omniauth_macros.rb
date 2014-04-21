require 'faker'

module OmniauthMacros
  def mock_auth_hash(provider)
    OmniAuth.config.mock_auth[provider] = {
      :provider   => provider.to_s,
      :uid        => rand(100000000).to_s,
      :info       => {
        :name     => Faker::Name.name,
        :nickname => Faker::Internet.user_name
      }
    }
  end

  def mock_invalid_credentials(provider)
    OmniAuth.config.mock_auth[provider] = :invalid_credentials
  end

end
