require("minitest/autorun")
require("minitest/rg")
require_relative("../models/albums.rb")
require_relative("../models/sales.rb")

class TestSale < MiniTest::Test

  def test_sell

    album1 = Album.new({'quantity' => 3})
    sale1 = Sale.new({'sale_quantity' => 1})
    album1.sell(sale1)
    assert_equal(2, album1.quantity)

  end

  def test_stock_warning

    album1 = Album.new({'quantity' => 3})
    sale1 = Sale.new({'sale_quantity' => 2})
    result = album1.sell(sale1)
    assert_equal("Remaining stock : 1", result)
  end

  def test_no_stock

    album1 = Album.new({'quantity' => 3})
    sale1 = Sale.new({'sale_quantity' => 3})
    result = album1.sell(sale1)
    assert_equal("Remaining stock : 0", result)
  end

  def test_insufficient_stock

    album1 = Album.new({'quantity' => 3})
    sale1 = Sale.new({'sale_quantity' => 4})
    result = album1.sell(sale1)
    assert_equal("There is insufficient stock for this sale", result)

  end

end
