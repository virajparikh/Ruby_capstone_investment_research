#!/usr/bin/env ruby

require_relative 'bootstrap_ar'
database = ENV['FP_ENV'] || 'development'
connect_to database

# ARGV = [add, Tech]
command = ARGV[0]
portfolio_name = ARGV[1]

params = { command: command, portfolio: { name: portfolio_name } }
controller = PortfolioController.new(params)  ##?

# This is a router:
if command == "add"
  controller.create
elsif command == "list"
  controller.index
elsif command == "remove"
  controller.destroy
else
  unless command == "help"
    puts "RubyStocks does not support the '#{command}' command.\n\n"
  end
  puts <<EOS
Currently supported commands are:
* portfolio list
* portfolio add <portfolio_name>
* portfolio remove <portfolio_name>

See the README for more details
EOS
end
