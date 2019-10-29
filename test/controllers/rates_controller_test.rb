require 'test_helper'

class RatesControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    get rate_url('eur'), as: :json
    assert_response :success
    assert_equal Hash, json_body.class
  end

  test "should render not_acceptable if currency is not supported" do
    get rate_url('bla'), as: :json
    assert_response :not_acceptable
    assert_equal RatesController::NOT_SUPPORTED, json_body
  end
end
