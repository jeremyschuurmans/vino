require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin        = User.create(name: "Harry Potter", email: "hpotter@hogwarts.edu", password: "quidditch", password_confirmation: "quidditch", admin: true)
    @not_an_admin = User.create(name: "Draco Malfoy", email: "dmalfoy@hogwarts.edu", password: "onedarkpassword", password_confirmation: "onedarkpassword")
  end

  test "index as admin includes delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    page_one = User.paginate(page: 1)
    page_one.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@not_an_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@not_an_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
