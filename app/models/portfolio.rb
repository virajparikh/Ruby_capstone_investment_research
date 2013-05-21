class Portfolio < ActiveRecord::Base
	validates_uniqueness_of :name, message: "already exists"
	has_many :tickers
end
