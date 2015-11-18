require 'test_helper'

class Inventory::WorkstationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
