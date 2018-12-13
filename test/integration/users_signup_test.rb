require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid sign up" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "harry@hogwarts",
                                         password: "hat",
                                         password_confirmation: "tah" } }

    end
    assert_template 'users/new'
    assert_select 'div#error_message'
    assert_select 'div.field_with_errors'
  end

  test 'valid sign up' do
    get signup_path

    assert_difference 'User.count' do
      post users_path, params: { user: { name: "Harry Potter",
                                         email: "hpotter@hogwarts.edu",
                                         password: "quidditch",
                                         password_confirmation: "quidditch" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
