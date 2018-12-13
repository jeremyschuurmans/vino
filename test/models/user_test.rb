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

  test "email validation should accept valid addresses" do
    valid_addresses = %w[hpotter@pottermore.com hpotter@hogwarts.edu HARRY@potter.COM H_AR-RY@team.gryffindor.org harry.potter@hogwarts.jp harry+potter@hogwarts.co]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be a valid email"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[harry@hogwarts,com harry_at_hogwarts.edu harry.potter@hogwarts. harry@hog_warts.com harry@hog+warts.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should not be valid"
    end
  end
end
