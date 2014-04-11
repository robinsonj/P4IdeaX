if TWITTER_ENABLED
  TWITTER_CONFIG = YAML.load(File.read(Rails.root.to_s + '/config/' + 'twitter.yml'))[Rails.env]
end
