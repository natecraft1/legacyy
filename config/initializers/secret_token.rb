# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

Wordsbond::Application.config.secret_key_base = '999490fb00704qe65589f39d096a8d047f768ebf2041a57ba4c29a39dacf4f3eb6b36b472d74474c313263f56b805c168b1560fc6e20e7c822156e3854a2547c'

# def secure_token
#   token_file = Rails.root.join('.secret')
#   if File.exist?(token_file)
#     # Use the existing token.
#     File.read(token_file).chomp
#   else
#     # Generate a new token and store it in token_file.
#     token = SecureRandom.hex(64)
#     File.write(token_file, token)
#     token
#   end
# end

