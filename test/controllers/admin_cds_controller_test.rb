require 'test_helper'

class AdminCdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cds_index_url
    assert_response :success
  end

end
