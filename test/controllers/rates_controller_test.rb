require 'test_helper'

class RatesControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    get rate_url('eur'), as: :json
    assert_response :success
    assert_equal Hash, json_body.class
  end

end
