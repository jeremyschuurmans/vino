require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name: "Harry Potter", email: "hpotter@hogwarts.edu", password: "quidditch", password_confirmation: "quidditch")
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "invalid@thisisatotallyinvalidemail",
                                              password: "quid",
                                              password_confirmation: "ditch" } }

    assert_template 'users/edit'
    assert_select 'div.alert', "Oops. 4 errors occurred."
  end
end
