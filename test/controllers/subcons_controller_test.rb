require 'test_helper'

class SubconsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subcons_index_url
    assert_response :success
  end

  test "should get new" do
    get subcons_new_url
    assert_response :success
  end

  test "should get edit" do
    get subcons_edit_url
    assert_response :success
  end

end
