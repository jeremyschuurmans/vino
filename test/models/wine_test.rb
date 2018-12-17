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
                              tasting_notes: "Both on the nose and palate, this Garnacha is mildly angular and pinching, with a sense of rawness brought on by hard tannins. Its foxy plum flavors are jumpy and nervy, finishing peppery and jagged.",
                              created_at: 4.years.ago)
    @wine_2 = @user.wines.build(name: "Charles & Charles Rose",
                                winery: "Charles & Charles",
                                vintage: "2017",
                                origin: "Columbia Valley, Washington",
                                price: "$12",
                                rating: 9,
                                tasting_notes: "This wine is a pretty, pale-salmon color. Aromas of strawberry bubblegum, herb, tropical fruit and citrus peel lead to dry fruit flavors, full of papaya, guava and pink-grapefruit notes with a tart finish. It flat-out delivers.",
                                created_at: 30.minutes.ago )
    @most_recent_wine = @user.wines.build(name: "Charles & Charles Cabernet Blend",
                                     winery: "Charles & Charles",
                                     vintage: "2015",
                                     origin: "Columbia Valley, Washington",
                                     price: "$13",
                                     rating: 9,
                                     tasting_notes: "Bold, rich and textured but not over the top – it remains wonderfully restrained and focused. Aromas of black cherry, blackberry, and earthy, savory notes of tobacco and herbs, vanilla, and cocoa. A full mouthfeel with a long and supple finish. It's an intense dark blue / purple in color with tremendous purity, depth, and focus. Tannins are elegant, and refined.",
                                     created_at: Time.zone.now)
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
    assert_equal @most_recent_wine, Wine.first
  end
end
