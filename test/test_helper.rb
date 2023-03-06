require 'simplecov'
if ENV["COVERAGE"]
  SimpleCov.start 'rails' do
    puts "Adding simplecov"
    enable_coverage :branch
    primary_coverage :branch
  end
end

# To use simplecov, do this: COVERAGE=true rake
require 'simplecov'
SimpleCov.start if ENV['COVERAGE']

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
