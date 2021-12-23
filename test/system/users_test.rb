require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Custom::Sorcery::TestHelpers

  setup do
    @user = users(:one)
    @capyuser = User.new(email: "capyuser@example.com", password: "capysecret")
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should show logged in as current user email" do
    sign_in(@user)
    assert_text "Logged in as: #{@user.email}"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Email", with: @capyuser.email
    fill_in "Password", with: @capyuser.password
    fill_in "Password confirmation", with: @capyuser.password
    click_on "Create User"

    assert_selector "h1", text: "Login"
    fill_in "Email", with: @capyuser.email
    fill_in "Password", with: @capyuser.password
    click_on "Login"
    assert_text "Login successful"
  end

  test "should update User" do
    sign_in(@user)
    visit user_url(@user)
    click_on "Edit user profile", match: :first
    click_on "Edit this user"
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back to users"
  end

=begin
  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
=end
end
