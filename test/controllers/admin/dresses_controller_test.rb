require "test_helper"

class Admin::DressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dresses_index_url
    assert_response :success
  end
end
