#!/usr/bin/env ruby

require_relative 'bootstrap_ar'
database = ENV['FP_ENV'] || 'development'
connect_to database

# ARGV = [add, foo]
command = ARGV[0]
portfolio_name = ARGV[1] # can be nil

params = { command: command, portfolio: { name: portfolio_name } }
controller = InvestPortfolio.new(params)

# This is a router:
if command == "add"
  controller.create
elsif command == "list"
  controller.index
elsif command == "remove"
  controller.destroy
elsif command == "start"
  controller.work
else
  unless command == "help"
    puts "RubyStocks does not support the '#{command}' command.\n\n"
  end
  puts <<EOS
Currently supported commands are:
* portfolio list
* portfolio add <project_name>
* portfolio remove <project_name>
* portfolio start

See the README for more details
EOS
end
