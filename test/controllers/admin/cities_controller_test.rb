require "test_helper"

class Admin::CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cities_index_url
    assert_response :success
  end
end
