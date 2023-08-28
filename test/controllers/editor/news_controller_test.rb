require "test_helper"

class Editor::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get editor_news_index_url
    assert_response :success
  end
end
