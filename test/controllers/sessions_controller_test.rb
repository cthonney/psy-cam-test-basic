require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sessions_show_url
    assert_response :success
  end
end
