require 'test_helper'

class WinesEditTest < ActionDispatch::IntegrationTest

  def setup
    @wine = wines(:rose)
    @user = User.create(name: "Bob Ross", email: "bob@pbs.org", password: "happylittleclouds", password_confirmation: "happylittleclouds")
  end

  test "should not allow users to edit a wine they did not create" do
    log_in_as(@user)
    patch wine_path(@wine), params: { wine: { name: "Chuck and Chuck Rose" } }

    assert_redirected_to root_url
  end
end
