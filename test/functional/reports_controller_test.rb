require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get by_address" do
    get :by_address
    assert_response :success
  end

  test "should get by_status" do
    get :by_status
    assert_response :success
  end

  test "should get by_user" do
    get :by_user
    assert_response :success
  end

end
