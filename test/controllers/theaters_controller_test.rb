require "test_helper"

class TheatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theaters_index_url
    assert_response :success
  end

  test "should get new" do
    get theaters_new_url
    assert_response :success
  end

  test "should get edit" do
    get theaters_edit_url
    assert_response :success
  end

  test "should get show" do
    get theaters_show_url
    assert_response :success
  end
end
