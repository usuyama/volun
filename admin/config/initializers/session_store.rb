# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_admin_session',
  :secret      => '3d74f2bd8f5d06a069ab4310e01a6b85d8eb6c1c113ea2cd46ac8fc41bb25531a25758f1e706d67cec61e50d8af8a866f3dc822c1de2ada54c269b3168dc0910'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
