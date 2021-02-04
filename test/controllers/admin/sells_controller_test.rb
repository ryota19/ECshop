require 'test_helper'

class Admin::SellsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sells_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sells_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_sells_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_sells_index_url
    assert_response :success
  end

end
