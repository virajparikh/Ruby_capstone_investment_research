require_relative '../test_helper'

class TestAddingPortfolio < MiniTest::Unit::TestCase
  # include DatabaseCleaner

  # def test_takes_arguments_and_saves_them
  #   assert_equal 0, Portfolio.count
  #   `ruby rubystocks add foo`
  #   assert_equal 1, Portfolio.count
  # end

  def test_takes_arguments_and_uses_them
    portfolio = Portfolio.create(name: "Viraj")
    assert_equal("Viraj", Portfolio.last.name)
  end

  # def test_duplicate_names_are_ignored
  #   Portfolio.create( name: 'foo' )
  #   original_Portfolio_count = Portfolio.count
  #   `ruby rubystocks add foo`
  #   assert_equal original_Portfolio_count, Portfolio.count
  # end

  # def test_duplicate_names_outputs_error_message
  #   Portfolio.create( name: 'foo' )
  #   results = `ruby rubystocks add foo`
  #   assert results.include?('Name must be unique'), "Actually was '#{results}'"
  # end
end
