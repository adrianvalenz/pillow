require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get login path if signed out" do
    get welcome_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end
