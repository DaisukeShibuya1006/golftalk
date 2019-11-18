require 'test_helper'

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get score_show_url
    assert_response :success
  end

end
