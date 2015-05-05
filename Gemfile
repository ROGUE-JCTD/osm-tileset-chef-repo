source "https://rubygems.org"

# Require rails
gem "rails", "4.2.1"

# Require json for multi_json
gem "json"

# Use postgres as the database
gem "pg"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use jquery as the JavaScript library
gem "jquery-rails"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
gem "jsonify-rails"

# Load rails plugins
gem "rails-i18n", "~> 4.0.0"
gem "dynamic_form"
gem "rinku", ">= 1.2.2", :require => "rails_rinku"
gem "oauth-plugin", ">= 0.5.1"
gem "validates_email_format_of", ">= 1.5.1"
gem "composite_primary_keys", "~> 8.1.0"
gem "http_accept_language", "~> 2.0.0"
gem "paperclip", "~> 4.0"
gem "deadlock_retry", ">= 1.2.0"
gem "openstreetmap-i18n-js", ">= 3.0.0.rc5.3", :require => "i18n-js"
gem "rack-cors"
gem "actionpack-page_caching"

# Omniauth for authentication
gem "omniauth"
gem "omniauth-openid"
gem "openstreetmap-omniauth-google-oauth2", ">= 0.2.6.1", :require => "omniauth-google-oauth2"

# Load libxml support for XML parsing and generation
gem "libxml-ruby", ">= 2.0.5", :require => "libxml"

# Use for HTML sanitisation
gem "sanitize"
gem "htmlentities"

# Load faraday for mockable HTTP client
gem "faraday"

# Gems useful for development
group :development do
  gem "vendorer"
end

# Gems needed for running tests
group :test do
  gem "rubocop"
  gem "timecop"
  gem "minitest", "~> 5.1", :platforms => [:ruby_19, :ruby_20]
end

# Needed in development as well so rake can see konacha tasks
group :development, :test do
  gem "jshint"
  gem "konacha"
  gem "poltergeist"
  gem "coveralls", :require => false
end
