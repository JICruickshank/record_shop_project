require("minitest/autorun")
require("minitest/rg")
require_relative("../models/albums.rb")

class TestAlbum < MiniTest::Test

  def test_stock_level

    album1 = Album.new({'quantity' => 2})
    album2 = Album.new({'quantity' => 5})
    album3 = Album.new({'quantity' => 10})
    assert_equal("Low", album1.stock_level)
    assert_equal("Medium", album2.stock_level)
    assert_equal("High", album3.stock_level)

  end
end
