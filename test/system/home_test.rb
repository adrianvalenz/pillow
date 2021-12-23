require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  include Custom::Sorcery::TestHelpers

  test "should show no listings if none exist" do
    Listing.stub(:all, []) do
      visit root_path
      assert_text "No listings"
    end
  end
end
