source 'http://rubygems.org'

gem 'rails', '3.0.0'
gem 'jquery-rails'
gem 'authlogic'
gem 'gravtastic', '2.1.3'
gem 'haml'
gem 'acts-as-taggable-on'
gem 'friendly_id'
gem "RedCloth"

# Deploy with Capistrano
gem 'capistrano'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :production do
	gem 'mysql', '2.8.1'
end