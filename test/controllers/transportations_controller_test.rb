require 'test_helper'

class TransportationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transportations_index_url
    assert_response :success
  end

  test "should get new" do
    get transportations_new_url
    assert_response :success
  end

  test "should get show" do
    get transportations_show_url
    assert_response :success
  end

  test "should get edit" do
    get transportations_edit_url
    assert_response :success
  end

end
