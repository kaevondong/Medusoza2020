require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_index_url
    assert_response :success
  end

  test "should get show" do
    get upload_show_url
    assert_response :success
  end

  test "should get new" do
    get upload_new_url
    assert_response :success
  end

  test "should get edit" do
    get upload_edit_url
    assert_response :success
  end

end
