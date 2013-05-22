require_relative '../test_helper'

class TestPortfolio < MiniTest::Unit::TestCase
  include DatabaseCleaner  ## what is this?

  def test_1_add_portfolio
    portfolio = Portfolio.create(name: "Tech")
    assert_equal("Tech", portfolio.name)
  end

  def test_2_listing_multiple_portfolios
    Portfolio.create(name: "Banks")
    Portfolio.create(name: "Tech")
    Portfolio.create(name: "Retail")
    actual = `ruby rubystocks.rb list`
    expected = <<EOS
1. Banks
2. Tech
3. Retail
EOS
    assert_equal expected, actual
  end

  def test_3_add_yet_another_portfolio
    portfolio = Portfolio.create(name: "Retail")
    assert_equal("Retail", portfolio.name)
  end

  # def test_4_takes_arguments_and_saves_them
  #   assert_equal 0, Project.count
  #   `ruby futureperfect add foo`
  #   assert_equal 1, Project.count
  # end

  # def test_5_takes_arguments_and_uses_them
  #   `ruby futureperfect add foo`
  #   assert_equal 'foo', Project.last.name
  # end

  # def test_6_duplicate_names_are_ignored
  #   Project.create( name: 'foo' )
  #   original_project_count = Project.count
  #   `ruby futureperfect add foo`
  #   assert_equal original_project_count, Project.count
  # end

  # def test_7_duplicate_names_outputs_error_message
  #   Project.create( name: 'foo' )
  #   results = `ruby futureperfect add foo`
  #   assert results.include?('Name must be unique'), "Actually was '#{results}'"
  # end
end
