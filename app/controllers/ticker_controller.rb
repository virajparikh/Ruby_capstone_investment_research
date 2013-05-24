class TickerController

  def initialize params
    @portfolio = Portfolio.where(name: params[:portfolio][:name]).first.id
  end

  def edit
    puts "Enter a stock ticker for this portfolio"
    stock = $stdin.gets.chomp.upcase
    Ticker.create(name: stock, portfolio_id: @portfolio)
    puts "Add another stock ticker? [y/n]"
    input = $stdin.gets.chomp.upcase
    edit if input == "y"
    if input == "n"
    	puts "view portfolio? [y/n]"
    	input = $stdin.gets.chomp
    	view_portfolio if input == "y"
    end
  end

  def view
  	tickers = Ticker.where(portfolio_id: @portfolio).all
    tickers.each_with_index do |ticker, i|
      puts  "#{i+1}. #{ticker.name}"
    end
  end

  def view_portfolio
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
