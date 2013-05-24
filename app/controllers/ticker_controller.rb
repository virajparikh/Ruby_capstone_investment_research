class TickerController

  def initialize params
    @portfolio = Portfolio.where(name: params[:portfolio][:name]).first.id
  end

  def edit
  	view
  	puts "Would you like to add or delete stock tickers from this portfolio? [a/d]"
  	input = $stdin.gets.chomp
  # 	add_ticker if input == "a"
  # end
    # puts "Enter a stock ticker for this portfolio:"
    
    # stock = $stdin.gets.chomp.upcase
    # Ticker.create(name: stock, portfolio_id: @portfolio)
    # puts "Add another stock ticker? [y/n]"
    # input = $stdin.gets.chomp.upcase
    add_ticker if input == "a"

    if input == "n"
    	puts "View all portfolios for this ticker? [y/n]"
    	input = $stdin.gets.chomp
    	view_portfolios if input == "y"
    end
  end

  def view
  	tickers = Ticker.where(portfolio_id: @portfolio).all
    tickers.each_with_index do |ticker, i|
      puts  "#{i+1}. #{ticker.name}"
    end
  end

  def add_ticker
  	puts "Add a stock ticker:"
  	stock = $stdin.gets.chomp.upcase
    Ticker.create(name: stock, portfolio_id: @portfolio)
  	puts "Add another stock ticker? [y/n]"
  	stock = $stdin.gets.chomp.upcase
    Ticker.create(name: stock, portfolio_id: @portfolio)
  end

  def delete_ticker
  	puts "Delete which stock ticker?"
    matching_tickers = Ticker.where(name: params[:portfolio][:name]).
    matching_tickers.each do |ticker|
      ticker.destroy
    end
  end

  def view_portfolios
  	puts "enter ticker name"
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

