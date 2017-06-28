require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get welcome_hello_url
    assert_response :success
  end

end
