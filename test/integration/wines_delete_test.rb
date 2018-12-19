require 'test_helper'

class WinesDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @wine = wines(:rose)
    @user = User.create(name: "Bob Ross", email: "bob@pbs.org", password: "happylittleclouds", password_confirmation: "happylittleclouds")
  end

  test "should not allow users to delete a wine they did not create" do
    log_in_as(@user)
    wine = wines(:cabernet)
    assert_no_difference 'Wine.count' do
      delete wine_path(wine)
    end
    assert_redirected_to root_url
  end
end
