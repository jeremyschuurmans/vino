require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: "Harry Potter", email: "hpotter@hogwarts.edu", password: "quidditch", password_confirmation: "quidditch")
    @user_2 = User.create(name: "Ron Weasley", email: "rweasley@hogwarts.edu", password: "scabbers", password_confirmation: "scabbers")

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
    valid_addresses = %w[HARRY@potter.COM H_AR-RY@team.gryffindor.org hgranger@hogwarts.edu harry.potter@hogwarts.jp harry+potter@hogwarts.co schuurm@ns.codes]
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

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "HpOttEr@HoGwaRTs.eDu"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length of 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  test "when a user is deleted, the associated wines should also be deleted" do
    @user.wines.create!(name: "Charles & Charles Rose",
                        winery: "Charles & Charles",
                        vintage: "2017",
                        origin: "Columbia Valley, Washington",
                        price: "$12",
                        rating: 9,
                        tasting_notes: "This wine is a pretty, pale-salmon color. Aromas of strawberry bubblegum, herb, tropical fruit and citrus peel lead to dry fruit flavors, full of papaya, guava and pink-grapefruit notes with a tart finish. It flat-out delivers.")
    assert_difference 'Wine.count', -1 do
      @user.destroy
    end
  end

  test "should follow and unfollow a user" do
    harry = @user
    ron = @user_2
    assert_not harry.following?(ron)
    harry.follow(ron)
    assert harry.following?(ron)
    assert ron.followers.include?(harry)
    harry.unfollow(ron)
    assert_not harry.following?(ron)
  end



end
