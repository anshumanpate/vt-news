require "test_helper"

class Admin::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_news_index_url
    assert_response :success
  end
end
