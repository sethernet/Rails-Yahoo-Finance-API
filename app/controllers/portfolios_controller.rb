class PortfoliosController < ApplicationController

  def update
  end

  def edit
  end

  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
	@portfolio = @user.portfolios.create
    @portfolio.title = params["title"]
    if @portfolio.save
      redirect_to root_url # "/"
    else
      render 'new'
    end
  end

  def index
  end

  def destroy
  end

  def show
  end

end