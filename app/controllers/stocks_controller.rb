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
    if @stock.save
      redirect_to root_url # "/"
    else
      render 'new'
    end
  end

  def index
	 @stocks = Stock.all
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