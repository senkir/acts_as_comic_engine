source 'http://rubygems.org'

gem 'rails', '3.0.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2', '< 0.3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:

#Views
gem 'haml' #easier view building
gem 'formtastic' #forms
gem 'kaminari' #pagination
gem 'barista' #coffeescript support
#Admin
gem 'activeadmin'
gem 'mini_magick'
gem 'cancan'

#File Handling
#gem 'rmagick', :require => 'RMagick' #image manipulation
gem 'carrierwave' #file uploads
gem 'fog' #supplemental gem for Amazon services
gem 'aws' #required for Amazon services
gem 'girl_friday' #free worker threads

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
    gem "rspec" #unit testing
    gem "rspec-rails", "~> 2.4"
    gem "capybara" #simulates user interaction
    gem "watchr" #continuous testing
    gem 'spork', '~> 0.9.0.rc'
end
