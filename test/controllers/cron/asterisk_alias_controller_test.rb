require 'test_helper'

class Cron::AsteriskAliasControllerTest < ActionController::TestCase
  test "should get aliases" do
    get :aliases
    assert_response :success
  end

end
