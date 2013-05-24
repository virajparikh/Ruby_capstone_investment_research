class Portfolio < ActiveRecord::Base
	validates_uniqueness_of :name, message: "Portfolio name already exists"
	has_many :tickers
end
