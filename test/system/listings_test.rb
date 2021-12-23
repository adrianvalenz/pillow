require "application_system_test_case"
require "minitest/mock"

class ListingsTest < ApplicationSystemTestCase
  include Custom::Sorcery::TestHelpers

  def setup
    @user = users(:one)
    @listing = listings(:one)
    sign_in(@user)
  end
  
  test "should show no listings if none exist" do
    Listing.stub(:all, []) do
      visit root_path
      assert_text "No listings"
    end
  end
  
  test "should see all listings on homepage if listings exists" do
    assert_equal 2, Listing.count, "Listing count should be 2"
    visit root_path
    assert_text "All listings"# if Listing.count >= 1
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
    assert_text "#{@user.email}\'s page"
    assert_text "Listing was created successfully"
  end

  test "should get to new listing page from user page" do
    visit root_path
    click_link "user-profile"
    click_on "Post listing"
    assert_selector "h1", text: "Post a new listing!"
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
    visit root_path
    click_on "All users"
    visit user_path(@user)
    assert_text "User listings"
    click_link "Edit listing"
    assert_selector "h1", text: "Update listing"

    fill_in "Title", with: "an update"
    fill_in "Description", with: "another update"
    fill_in "Zipcode", with: "98712"
    fill_in "Price", with: "220"
    click_on "Update Listing"
    assert_text "#{@user.email}\'s page"
    assert_text "Listing was successfully updated"
  end

  test "should delete listing" do
    visit user_path(@user)
    click_on "Delete"
    assert_text "Listing was deleted"
  end
end
