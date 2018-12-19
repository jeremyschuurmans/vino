require 'test_helper'

class WinesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @wine = wines(:rose)
    @user = User.create(name: "Bob Ross", email: "bob@pbs.org", password: "happylittleclouds", password_confirmation: "happylittleclouds")
  end

  test "should not allow users to access create when not logged in" do
    assert_no_difference 'Wine.count' do
      post wines_path, params: { wine: { name: "Rombauer Chardonnay",
                                         winery: "Rombauer Vineyards",
                                         vintage: "2017",
                                         origin: "Carneros, California",
                                         price: "$32",
                                         rating: 10,
                                         tasting_notes: "The 2017 Chardonnay features compelling spiced apples, almond croissant,
                                                        honeyed peaches and fresh baked pear tart notions on the nose.
                                                        Medium-bodied with a satiny texture, the palate delivers plenty of
                                                        peaches and savory layers with a racy line and mineral-tinged finish." } }

      end
    assert_redirected_to login_url
  end

  test "should not allow users to access destroy when not logged in" do
    assert_no_difference 'Wine.count' do
      delete wine_path(@wine)
    end
    assert_redirected_to login_url
  end

  test "should not allow users to access edit when not logged in" do
    get root_url
    get edit_wine_path(@wine)
    assert_redirected_to login_url
  end
end
