ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #
  module Custom
    module Sorcery
      module TestHelpers
        def sign_in(user)
          visit login_path
          fill_in "Email", with: user.email
          fill_in "Password", with: 'secret'
          click_on "Login"
          assert_text "Login successful"
        end
      end
    end
  end
end

