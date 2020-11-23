require 'test_helper'

class TimePointingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get time_pointing_index_url
    assert_response :success
  end

  test "should get new" do
    get time_pointing_new_url
    assert_response :success
  end

  test "should get create" do
    get time_pointing_create_url
    assert_response :success
  end

  test "should get destroy" do
    get time_pointing_destroy_url
    assert_response :success
  end

end
