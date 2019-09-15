require 'test_helper'

class TransportatinControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transportatin_index_url
    assert_response :success
  end

  test "should get new" do
    get transportatin_new_url
    assert_response :success
  end

  test "should get show" do
    get transportatin_show_url
    assert_response :success
  end

  test "should get edit" do
    get transportatin_edit_url
    assert_response :success
  end

end
