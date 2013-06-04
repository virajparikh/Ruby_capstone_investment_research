require_relative '../test_helper'

class TestTickers < MiniTest::Unit::TestCase
  include DatabaseCleaner  ## what is this?

  def test_9_add_tickers
    Portfolio.create!(name: "Tech")
    shell_output = ""
    IO.popen('ruby rubystocks edit Tech', 'r+') do |pipe|
      pipe.puts("a")
      pipe.puts("GOOG")
      pipe.puts("AAPL")
      pipe.puts("MSFT")
      pipe.puts("quit")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, ""
    assert_includes shell_output, "Would you like to add or delete stock tickers from this portfolio? [a/d]"
    assert_includes shell_output, "Add a stock ticker:"
    assert_includes shell_output, "Add another stock ticker (press 'quit' to exit):"
    assert_includes shell_output, "
1. GOOG
2. AAPL
3. MSFT"
  end

  def test_10_delete_tickers
    Portfolio.create!(name: "Tech")
    shell_output = ""
    IO.popen('ruby rubystocks edit Tech', 'r+') do |pipe|
      pipe.puts("d")
      pipe.puts("GOOG")
      pipe.puts("AAPL")
      pipe.puts("MSFT")
      pipe.puts("quit")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes shell_output, ""
    assert_includes shell_output, "Would you like to add or delete stock tickers from this portfolio? [a/d]"
    assert_includes shell_output, "Add a stock ticker:"
    assert_includes shell_output, "Add another stock ticker (press 'quit' to exit):"
    assert_includes shell_output, "
1. GOOG
2. AAPL
3. MSFT"
  end


  # def test_11_delete_tickers
  
  # end


  # def test_12_view_portfolio_tickers

  # end



end