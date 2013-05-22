class Ticker < ActiveRecord::Base
	# validates_uniqueness_of :ticker, message: "already exists"
	belongs_to :portfolio
end