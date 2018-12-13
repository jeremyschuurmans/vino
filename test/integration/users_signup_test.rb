require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid sign up" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "harry@hogwarts",
                                         password: "hat",
                                         password_confirmation: "tah"} }

    end
    assert_template 'users/new'
    assert_select 'div#error_message'
    assert_select 'div.field_with_errors'
  end
end
