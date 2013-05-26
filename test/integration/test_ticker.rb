require_relative '../test_helper'

class TestTickers < MiniTest::Unit::TestCase
  include DatabaseCleaner  ## what is this?

  def test_9_add_ticker
    portfolio = Ticker.create(name: "Tech")
    `ruby rubystocks add Tech`
    assert_equal(1, ticker.count)
  end

  def test_add_ticker_creates_correct_name
    portfolio = Ticker.create(name: "Tech")
    `ruby rubystocks add Tech`
    assert_equal("GOOG", portfolio.tickers.last.name)
  end

  # def test_add_more_tickers
  #   Ticker = Ticker.add(name: "GOOG")
  #   Ticker = Ticker.add(name: "AAPL")
  #   Ticker = Ticker.add(name: "MSFT")
  #   assert_equal("Banks", ticker.name)
  # end

  # def test_add_yet_another_Ticker
  #   Ticker = Ticker.add(name: "Retail")
  #   assert_equal("Retail", ticker.name)
  # end


  # def test_list_all_portfolios
  #   assert results.include?("Tech Banks"), true
  # end
end