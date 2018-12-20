require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @user_1 = User.create(name: "Harry Potter", email: "hpotter@hogwarts.edu", password: "quidditch", password_confirmation: "quidditch")
    @user_2 = User.create(name: "Ron Weasley", email: "rweasley@hogwarts.edu", password: "scabbers", password_confirmation: "scabbers")
    @relationship = Relationship.new(follower_id: @user_2.id, followed_id: @user_1.id)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end


end
