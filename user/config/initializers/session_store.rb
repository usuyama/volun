# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_user_session',
  :secret      => '1683e429ae3676bc8be470cbaca19ed80a10f9c622a3d548bb80b8c9641c2a94645c82cac0d74fbe76d69f76b71a4fb46787ade2eeedf951cf3603cb1518d6d1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
