# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spork'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Spork.prefork do
  require 'coveralls'
  Coveralls.wear!('rails')

  ENV["RAILS_ENV"] ||= 'test'
  require 'factory_girl'
  Spork.trap_class_method(FactoryGirl, :find_definitions)
  require 'database_cleaner'
  # Spork.trap_class_method(FactoryGirl, :find_definitions)
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.include Devise::TestHelpers, :type => :controller
    config.before(:suite) do
      begin
        DatabaseCleaner.strategy = :truncation
        DatabaseCleaner.start
      ensure
        DatabaseCleaner.clean
      end
    end
  end
end
Spork.each_run do
end

Spork.each_run do
  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
end if Spork.using_spork?

require 'sunspot/rails/spec_helper'

module DisableFlashSweeping
  def sweep
  end
end
