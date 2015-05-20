ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require "webmock/minitest"
require "database_cleaner"

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

class Minitest::Test
  def setup
    DatabaseCleaner.start

    Product.create!(price: 23.99) if Product.current.nil?

    stub_request(:post, /api\.pusherapp\.com/).with(
      body: /\d+ cases? to \w+ in /
    ).to_return(body: {success: true}.to_json, status: 200)

    stub_request(:post, /api\.pusherapp\.com/).with(
      body: /shipped \d+ cases? to \d+ happy customers? in \d+ countr[y|ies]/
    ).to_return(body: {success: true}.to_json, status: 200)    
  end

  def teardown
    DatabaseCleaner.clean
  end
end
