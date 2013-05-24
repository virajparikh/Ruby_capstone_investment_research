class AddColumnToTicker < ActiveRecord::Migration
	def change
		add_column(:tickers, :portfolio_name, :string)
	end
end
