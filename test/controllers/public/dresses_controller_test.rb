require "test_helper"

class Public::DressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_dresses_new_url
    assert_response :success
  end

  test "should get show" do
    get public_dresses_show_url
    assert_response :success
  end

  test "should get index" do
    get public_dresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_dresses_edit_url
    assert_response :success
  end
end
