require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get pipoca" do
    get home_pipoca_url
    assert_response :success
  end
end
