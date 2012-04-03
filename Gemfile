source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'mail', '2.3.0'
gem 'breadcrumbs_on_rails'

#gem 'bcrypt-ruby', '3.0.1-x86-mingw32'


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
	gem 'sqlite3'
end

group :production do
	gem 'therubyracer-heroku', '~> 0.8.1.pre3', :platform => :ruby
	gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails', '1.0.16'#Comment this while deploying to Production
gem 'closure-compiler'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
