class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  before_action :authorize_user, only: [:show, :edit, :update]	
  	
  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "Please login first."
    end
  end

  def authorize_user
     
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
	  redirect_to root_url, notice: "Please login first."
	end
	
  end	
	
  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
	  user = User.find_by_email(params["email"])
	  session[:user_id] = user.id
	  @portfolio = user.portfolios.create(title: 'My Portfolio')
	  @portfolio.stocks << Stock.all
      flash[:notice] = "You are now signed up!"
      redirect_to stocks_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
	@user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.password.present? && @user.password == params[:password_confirmation]
      if @user.save
        flash[:notice] = "Account updated successfully."
        redirect_to user_url(@user.id)
      else
        render 'edit'
      end
    else
      @user.errors.add(:password, "does not match")
      render 'edit'
    end
  end

end