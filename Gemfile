source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'mysql2'
gem 'haml'
gem 'bcrypt-ruby', '3.0.1'
gem 'omniauth-facebook'
gem 'sass-rails', '~> 3.2'
gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'compass-rails', '1.0.3'
gem 'hominid'
gem 'pictos-free', '~> 0.0.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'coffee-rails', '~> 3.2.2'
gem 'gchartrb'
gem 'heroku', '~> 2.4.0'
gem 'best_in_place'
gem 'mail_view', git: 'git://github.com/37signals/mail_view.git', ref: '6a4bc7f01a'
gem 'open4' # required by rubber
gem 'rubber', :git => 'git://github.com/rubber/rubber.git'
gem 'unicorn'

group :assets do
  gem 'uglifier'
  gem 'therubyracer'
  # include other compass plugins here. E.g.:
  # gem 'compass-susy-plugin', :require => 'susy'
end

group :development do
  gem 'capistrano', '~> 2.12'
  gem 'ruby-graphviz', :require => 'graphviz' # Optional: only required for graphing
  gem 'bullet'
end

group :production do
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'webrat'
  gem 'rspec-rails', '~> 2.13.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'fixture_builder'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  	gem 'spork'
  	gem 'rspec', '~> 2.13.0'
  	gem 'timecop'
  	gem 'fakeweb'
end
gem 'rubber'
gem 'open4'
