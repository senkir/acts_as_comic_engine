require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  
  RSpec.configure do |config|
    config.mock_with :rspec
    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
  
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
  end

# Dir[Rails.root.join("app/models/*/.rb")].each { |f| load f }
end

Spork.each_run do
  # This code will be run each time you run your specs.  
  load "#{Rails.root}/config/routes.rb" 
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f}
end

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
