# Customize with your project's name. Example:
#
#     COMPANY_NAME = 'Widgets by Quentin'
#     SHORT_SITE_NAME = 'Ideaomatic'

COMPANY_NAME = 'YOUR_COMPANY_NAME'
SHORT_SITE_NAME = 'SHORT_SITE_NAME'
LONG_SITE_NAME = "#{COMPANY_NAME} #{SHORT_SITE_NAME}"

# Set these to the hostnames of the machines where you'll be doing your deploys.
PRODUCTION_HOST = 'your_production_host.com'
STAGING_HOST = 'your_staging_host.com'
EMAIL_FROM_ADDRESS = "#{LONG_SITE_NAME} <noreply@#{PRODUCTION_HOST}>"

# Tag names shown in the idea tag editor as examples before user input.
# Customize to suit your product/idea coverage needs.
EXAMPLE_TAGS = 'music, home entertainment, discount'

# Configure omniauth providers in 'config/initializers/auth_providers.rb'
# Set the provider flags you wish to use to 'true' here.
TWITTER_ENABLED = (Rails.env.test? || Rails.env.development?) || false
FACEBOOK_ENABLED = (Rails.env.test? || Rails.env.development?) || false

# # Customize the user contribution points for various activities, if you like.
# CONTRIBUTION_SCORES = {
#   :idea    => 10,
#   :comment => 2,
#   :vote    => 1
# }

# # Get an ID from http://addthis.com to add a "Share This" link to ideas.
# ADDTHIS_ID = nil

# # Get a tracking code from http://www.google.com/analytics/ to enable Google Analytics.
# GOOGLE_ANALYTICS_TRACKING_CODE = nil

# # Get a key from http://www.google.com/webmasters/ to enable Google's webmaster tools.
# GOOGLE_WEBMASTER_KEY = nil

# # Akistmet provides spam filtering for comments. Get a key at: http://akismet.com/commercial/ or http://akismet.com/personal/
# # Once you've registered, pass your Akismet API key in the environment variable RAKISMET_KEY.
# # This will enable spam filtering.
# RAKISMET_URL = "http://#{PRODUCTION_HOST}"

# # Time after which an idea marked as spam will be permanently deleted. Set to nil to disable spam purging.
# SPAM_PURGE_AGE = 30 # days

# When displaying nearby ideas, if browser geolocation fails and the user is not logged in, we have no idea
# where the user is located. In that case, the system then displays ideas near this zip code.
# DEFAULT_ZIP_CODE = '55423'
