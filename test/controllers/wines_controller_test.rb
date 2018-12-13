require 'test_helper'

class WinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_wine_path
    assert_response :success
  end

end
