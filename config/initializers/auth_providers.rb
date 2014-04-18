if TWITTER_ENABLED
  TWITTER_CONFIG = YAML.load(File.read(Rails.root.to_s + '/config/' + 'omniauth_providers.yml'))['twitter'][Rails.env]
end

if FACEBOOK_ENABLED
  FACEBOOK_CONFIG = YAML.load(File.read(Rails.root.to_s + '/config/' + 'omniauth_providers.yml'))['facebook'][Rails.env]
end
