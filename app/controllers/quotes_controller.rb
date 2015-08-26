class QuotesController < ApplicationController

require 'open-uri'
require 'json'

  def update
  end

  def edit
  end

  def new
  end

  def create
  end

  def index
  
    @company_name = params["get_quote"]
	@user = User.find_by(id: session[:user_id])
	@portfolios = @user.portfolios
	begin
	jsonp = open("http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{@company_name}&callback=YAHOO.Finance.SymbolSuggest.ssCallback").read
	reg_json = jsonp[/{.+}/]
	@data = JSON.parse(reg_json)
	@symbol = @data['ResultSet']['Result'][0]['symbol']
	@co_name = @data['ResultSet']['Result'][0]['name']
	rescue
	flash[:notice] = "There is no data for that company or ticker. Please Try again."
	redirect_to root_url
	ensure
	@stock = StockQuote::Stock.quote(@symbol)
	if @stock.failure?
	flash[:notice] = "There is no data for that company or ticker. Please Try again."
	end
	end
	
  end

  def destroy
  end

  def show 
  end

end