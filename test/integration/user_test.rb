require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "guest user" do
    get links_path
    assert_select "a", "Signup"
    assert_select "a", "Login"
  end

  test "user can be logged in" do
    sign_in users(:one)
    get links_path
    assert_select "a", "Profile"
    assert_select "button", "Logout"
    # assert_match "Profile", response.body
  end
end
