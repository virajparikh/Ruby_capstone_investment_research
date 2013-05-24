class Ticker < ActiveRecord::Base
	validates_uniqueness_of :name, :scope => :portfolio_id, message: "Stock ticker already exists"
	belongs_to :portfolio
end