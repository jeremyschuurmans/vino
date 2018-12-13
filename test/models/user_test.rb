require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Harry Potter", email: "hpotter@hogwarts.edu")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not be longer than 100 characters" do
    @user.name = "a" * 101
    assert_not @user.valid?
  end

  test "email should not be longer than 100 characters" do
    @user.email = "a" * 101 + "@hogwarts.edu"
    assert_not @user.valid?
  end
end
