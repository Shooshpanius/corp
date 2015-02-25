require 'test_helper'

class Stat::NumberControllerTest < ActionController::TestCase
  test "should get corp" do
    get :corp
    assert_response :success
  end

  test "should get internal" do
    get :internal
    assert_response :success
  end

end
