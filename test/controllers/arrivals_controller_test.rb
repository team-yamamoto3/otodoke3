require 'test_helper'

class ArrivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get arrivals_new_url
    assert_response :success
  end

  test "should get index" do
    get arrivals_index_url
    assert_response :success
  end

end
