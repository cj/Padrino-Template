require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
  require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
  require 'rspec/core/rake_task'
  require 'rspec/autorun'
  require 'capybara'
  require 'capybara/dsl'
  require 'capybara/rspec'
  require 'factory_girl'
  # require "webmock"
  require "rspec/expectations"
  # require "webmock/rspec"
  # For passing XML
  require "hpricot"
  # require 'capybara/mechanize'

  # INSTALL THIS IN YOUR PATH TO USE
  # http://collectiveidea.com/blog/archives/2011/09/27/use-chrome-with-cucumber-capybara/
  # brew install chromedriver or
  # http://code.google.com/p/chromium/downloads/list
  Capybara.app = Padrino.application
  Capybara.save_and_open_page_path = 'tmp/capybara'

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :ignore_ssl_errors => true)
  end

  # http://collectiveidea.com/blog/archives/2011/07/13/the-search-for-speedier-javascript-scenarios/
  # brew install qt
  Capybara.javascript_driver = :webkit

  RSpec.configure do |config|
    config.include Rack::Test::Methods
    config.include Capybara::DSL

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation, { :except => %w[roles]}
      DatabaseCleaner.clean_with(:truncation, { :except => %w[roles]} )
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.include Factory::Syntax::Methods

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    # Stop on first error
    config.fail_fast = true
#
    # config.include WebMock::API
    config.mock_with 'mocha'
  end

  # %x[bundle exec rake db:migrate]
  # %x[bundle exec rake assets:precompile]
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  # WebMock.reset!
end