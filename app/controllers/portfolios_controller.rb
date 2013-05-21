class PortfoliosController

  def initialize params
    @params = params
  end

  def index
    portfolios = Portfolio.all
    portfolios.each_with_index do |portfolio, i|
      puts "#{i+1}. #{portfolio.name}"
    end
  end

  def create
    portfolio = Portfolio.new(params[:portfolio])
    if portfolio.save
      puts "Success!"
    else
      puts "Failure :( #{portfolio.errors.full_messages.join(", ")}"
    end
  end

  def destroy
    matching_portfolios = Portfolio.where(name: params[:portfolio][:name]).all
    matching_portfolios.each do |portfolio|
      portfolio.destroy
    end
  end

  def work
    portfolio = Portfolio.first
    if portfolio
      portfolio.update_attribute(:last_worked_at, Time.now)
      add_line colorize("#{portfolio.name}", GREEN)
      Countdown.for(portfolio.minutes_to_work)
    else
      puts "You must enter a portfolio before you can start working"
    end
  end

  private

  def params
    @params
  end
end
