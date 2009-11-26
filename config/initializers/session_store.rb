# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_molehill_session',
  :secret      => '2fe5456bfc352b23c34080f8c57d1e0c7fe87dd9f0287d3f6c89d804fe14b89d01238a2edf6646dc83a94655bd0185b76fadbf7e010ccf056dee659c9a4d3cac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
