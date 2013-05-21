require 'bundler'
Bundler.setup
require "rubygems"
require "active_record"

portfolio_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(portfolio_root + "/lib/*.rb").each{|f| require f}
Dir.glob(portfolio_root + "/app/**/*.rb").each{|f| require f}

def connect_to env
  connection_details = YAML::load(File.open('config/database.yml'))
  ActiveRecord::Base.establish_connection(connection_details[env])
end