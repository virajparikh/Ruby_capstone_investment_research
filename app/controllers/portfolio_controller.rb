class PortfolioController

  def initialize params
    @params = params
  end

  def index
    portfolios = Portfolio.all
    portfolios.each_with_index do |portfolio, i|
      puts  "#{i+1}. #{portfolio.name}"
    end
  end

  def create
    portfolio = Portfolio.new(params[:portfolio])
    if portfolio.save
      puts "Success!"
    else
      puts "Sorry, your portfolio did not save.  That portfolio name already exists."
    end
  end

  def destroy
    matching_portfolios = Portfolio.where(name: params[:portfolio][:name]).all
    matching_portfolios.each do |portfolio|
      portfolio.destroy
    end
  end

  private  # what is this?

  def params
    @params
  end
end
