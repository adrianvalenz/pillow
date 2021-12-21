require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  include Custom::Sorcery::TestHelpers

  def setup
    @user = users(:one)
    @listing = listings(:one)
    sign_in(@user)
  end

  test "should visit new listing page" do
    visit welcome_path
    assert_text "Create a new listing!"
    click_on "New listing"
    assert_selector "h1", text: "Post a new listing!"
  end

  test "should create listing" do
    visit new_user_listing_path(@user)
    assert_selector "h1", text: "Post a new listing!"

    fill_in "Title", with: "A listing title"
    fill_in "Description", with: "a listing description"
    fill_in "Zipcode", with: "92340"
    fill_in "Price", with: "200"

    click_on "Create Listing"
    assert_text "Listing was created successfully"
  end

  test "should display listings under user show page" do
    visit root_path
    click_on "All users"
    assert_text "Users"
    click_on "#{@user.email} page"
    assert_text "#{@user.email}\'s page"
    assert_selector "h2", text: "User listings"
  end

  test "should update listing" do
    visit user_path(@user)
    assert_text "User listings"
    click_on "Edit listing:"
    assert_text "Edit #{@listing.title}"
    click_on "Update Listing"
  end

  test "should delete listing" do
    visit user_path(@user)
    click_on "Delete"
    assert_text "Listing was deleted"
  end
end
