require 'test_helper'

class Admin::UserDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_details_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_user_details_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_details_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_user_details_edit_url
    assert_response :success
  end

end
