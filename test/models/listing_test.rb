require "test_helper"

class ListingTest < ActiveSupport::TestCase
  def setup
    @listing = listings(:one)
  end

  test "invalid if zipcode is nil" do
    @listing.zipcode = ""
    assert_not @listing.valid?, "zipcode should not be empty"
  end

  test "invalid if zipcode length exceeds 5 characters" do
    @listing.zipcode = "a" * 6
    assert_not @listing.valid?, "zipcode should have only 5 characters max"
  end

  test "invalid if zipcode length is less than 5 characters" do
    @listing.zipcode = "a" * 4
    assert_not @listing.valid?, "zipcode should not be less than 5 characters"
  end

  test "invalid if zipcode is not numbers" do
    @listing.zipcode = "n1234"
    @listing.zipcode.scan(/\D/).empty?
    assert_not @listing.valid?, "zipcode should be numbers"
  end
end
