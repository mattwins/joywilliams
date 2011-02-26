# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_joy_session',
  :secret      => '56e8e7ed2fb00c16ef53d3486645b1b17262f73823554e588b546947da42bc4f69a191c0a05940a3a3409b714c1b13bad2094eb9c0aa9830a56f152ca4051b21'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
