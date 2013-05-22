require_relative '../test_helper'

class TestPortfolio < MiniTest::Unit::TestCase
  include DatabaseCleaner  ## what is this?

  def test_1_add_portfolio
    `ruby rubystocks add Tech`
    portfolio = Portfolio.last
    assert_equal("Tech", portfolio.name)
  end

  def test_2_listing_multiple_portfolios
    Portfolio.create(name: "Banks")
    Portfolio.create(name: "Tech")
    Portfolio.create(name: "Retail")
    actual = `ruby rubystocks list`
    expected = <<EOS
1. Banks
2. Tech
3. Retail
EOS
    assert_equal expected, actual
  end

  def test_3_listing_no_portfolios
    assert Portfolio.all.empty?
    actual = `ruby rubystocks list`
    assert_equal "", actual
  end

  def test_4_remove_portfolio
    Portfolio.create( name: "Tech")
    `ruby rubystocks remove Tech`
    assert Portfolio.all.empty?
  end


  def test_5_takes_arguments_and_saves_them
    assert_equal 0, Portfolio.count
    `ruby rubystocks add Banks`
    assert_equal 1, Portfolio.count
  end

  def test_6_takes_arguments_and_uses_them
    `ruby rubystocks add Tech`
    `ruby rubystocks add Banks`
    `ruby rubystocks add Housing`
    assert_equal 'Tech', Portfolio.first.name
    assert_equal 'Housing', Portfolio.last.name
  end

  def test_7_duplicate_names_are_ignored
    Portfolio.create( name: 'Tech' )
    original_portfolio_count = Portfolio.count
    `ruby rubystocks add Tech`
    assert_equal original_portfolio_count, Portfolio.count
  end

  def test_8_duplicate_names_outputs_error_message
    Portfolio.create( name: 'Banks' )
    results = `ruby rubystocks add Banks`
    assert results.include?("Sorry, your portfolio did not save.  That portfolio name already exists.")
  end
end
