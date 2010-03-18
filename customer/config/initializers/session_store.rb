# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_customer_session',
  :secret      => '6298807d08dd11a32862882ecdde8e618f7a4969dc206975f44b93d8e0bc18cea75806b8ca9d71a489ee4a03868e09a3cfc26c01bb3be0d04859925be7776fb7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
