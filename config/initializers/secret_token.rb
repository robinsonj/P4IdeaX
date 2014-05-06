# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret_token')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    new_token = SecureRandom.hex(64)
    File.write(token_file, new_token)
    new_token
  end
end

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
BBYIDX::Application.config.secret_key_base = secure_token
