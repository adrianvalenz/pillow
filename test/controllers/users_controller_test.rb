require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration

  setup do
    @user = users(:one)
    login_user(@user)
  end

  def login_user(user)
    post login_path, params: { email: user.email, password: 'secret' }
    follow_redirect!
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { password: 'secret', email: 'admin3@example.com', password_confirmation: 'secret' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { crypted_password: @user.crypted_password, email: @user.email, salt: @user.salt } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
