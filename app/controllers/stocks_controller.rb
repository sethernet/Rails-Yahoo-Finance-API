class StocksController < ApplicationController

  def update
    stock = Stock.find_by(:id => params["id"])
    stock.company_name = params[:company_name]
    stock.ticker = params[:ticker]
	stock.quote = params[:quote]
	stock.price_change = params[:price_change]
	stock.percentage_change = params[:percentage_change]
    stock.save
    redirect_to root_url
  end

  def edit
    @stock = Stock.find_by(:id => params["id"])
  end

  def new
	 @stock = Stock.new
  end

  def create
    @stock = Stock.new
    @stock.company_name = params["company_name"]
    @stock.ticker = params["ticker"]
	@stock.quote = params["quote"]
	@stock.price_change = params["price_change"]
	@stock.percentage_change = params["percentage_change"]
	
	@portfolio = Portfolio.find_by(:id => params["portfolio_id"])
	@portfolio.stocks << @stock
	
    if @stock.save && @portfolio.save
      redirect_to root_url # "/"
    else
      render 'new'
    end
  end

  def index
	 
	 if session[:user_id]
	 @user = User.find_by(id: session[:user_id])
	 @feeds = Feed.all.limit(12).order('published_at desc')
	 @portfolios = @user.portfolios
	 
	 if(params.has_key?(:portfolio_id))
	 @portfolio = Portfolio.find_by(:id => params["portfolio_id"])
	 else
	 @portfolio = Portfolio.find_by(:id => 1)
	 end
	 
	 @portfolio.stocks.first(5).each do |stock|
	 Feed.update_from_feed("http://finance.yahoo.com/rss/headline?s=#{stock.ticker}")
	 end
	 
	 else
	   render 'index'
	 end  

  end

  def destroy
    @stock = Stock.find_by(:id => params["id"])
    @stock.delete
    redirect_to "/stocks"
  end

  def show 
    @stock = Stock.find_by(:id => params["id"])
  end

end