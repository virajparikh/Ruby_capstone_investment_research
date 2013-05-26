class TickerController

  def initialize params
    @portfolio_id = Portfolio.where(name: params[:portfolio][:name]).first.id
  end

  def edit
  	view
  	puts "Would you like to add or delete stock tickers from this portfolio? [a/d]"
  	input = $stdin.gets.chomp
    if input == "a"
      return add_ticker
    else delete_ticker
    end

    if input == "n"
    	puts "View all portfolios for this ticker? [y/n]"
    	input = $stdin.gets.chomp
    	view_portfolios if input == "y"
    end
  end

  def view
  	tickers = Ticker.where(portfolio_id: @portfolio_id).all
    tickers.each_with_index do |ticker, i|
      puts  "#{i+1}. #{ticker.name}"
    end
  end

  def add_ticker
  	puts "Add a stock ticker:"
  	stock = $stdin.gets.chomp.upcase
    Ticker.create(name: stock, portfolio_id: @portfolio_id)
  	while stock != "QUIT" do
  	  puts "Add another stock ticker (press quit to exit)"
  	  stock = $stdin.gets.chomp.upcase
      Ticker.create(name: stock, portfolio_id: @portfolio_id) unless stock == "QUIT" || stock == ""
    end
  end

  def delete_ticker
  	puts "Delete which stock ticker?"
    stock_name = $stdin.gets.chomp.upcase
    matching_tickers = Ticker.where(name: stock_name, portfolio_id: @portfolio_id)
    matching_tickers.each do |ticker|
      ticker.destroy
    end
  end

  def view_portfolios
  	puts "Enter ticker name:"
  	ticker_name = $stdin.gets.chomp.upcase
  	ports = Ticker.where(name: ticker_name).all
  	ports.each_with_index do |p, i|
  		puts "#{i + 1}. #{p.portfolio.name}"
  	end
  end

  private

  def params
    @params
  end
end

