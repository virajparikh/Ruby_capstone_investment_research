class RenameColumn < ActiveRecord::Migration
	def change
		rename_column(:tickers, :portfolio_name, :portfolio_id)
	end
end