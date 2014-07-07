# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Chess::Application.config.secret_key_base = '7ed49999cc8cc24c3b6d719bf277342a155393e89574355c4cf36e36a23d06a33d5a935329ed35677ad7613a640042c6581c98f35d22b85a8d95c7feca94630a'
