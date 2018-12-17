require 'test_helper'

class WineTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: "Harry Potter", email: "hpotter@hogwarts.edu", password: "quidditch", password_confirmation: "quidditch")
    @wine = @user.wines.build(name: "Borsao Garnacha",
                              winery: "Borsao",
                              vintage: "2016",
                              origin: "Spain",
                              price: "$9",
                              rating: 6,
                              tasting_notes: "Both on the nose and palate, this Garnacha is mildly angular and pinching, with a sense of rawness brought on by hard tannins. Its foxy plum flavors are jumpy and nervy, finishing peppery and jagged.")
  end

  test "should be vaid" do
    assert @wine.valid?
  end

  test "user id should be present" do
    @wine.user_id = nil
    assert_not @wine.valid?
  end

  test "should have a name" do
    @wine.name = " "
    assert_not @wine.valid?
  end

  test "should have a winery" do
    @wine.winery = " "
    assert_not @wine.valid?
  end

  test "should have a vintage" do
    @wine.vintage = " "
    assert_not @wine.valid?
  end

  test "should have an origin" do
    @wine.origin = " "
    assert_not @wine.valid?
  end

  test "should have a price" do
    @wine.price = " "
    assert_not @wine.valid?
  end

  test "should have a rating" do
    @wine.rating = " "
    assert_not @wine.valid?
  end

  test "should have tasting notes" do
    @wine.tasting_notes = " "
    assert_not @wine.valid?
  end

  test "most recent wine posts should appear first" do
    assert_equal wines(:most_recent_wine), Wine.first
  end
end
