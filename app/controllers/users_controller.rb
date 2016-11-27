class UsersController < ApplicationController

  def home
  end

  def new
  end

  def create
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]

    if user.save
      session[:user_id] = user.id

      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    if session[:user_id] != params[:id].to_i
      redirect_to '/'
    end

    @user = User.find(params[:id])
  end

  def update
    if session[:user_id] != params[:id].to_i
      redirect_to '/'
    end

    @user = User.find(session[:user_id])
    @user.email = params[:email]
    @user.name = params[:name]
    @user.username = params[:username]
    if params[:password] != ''
      @user.password = params[:password]
    end

    if @user.save
      flash[:success] = "Your account was updated successfully"
      redirect_to "/users/#{session[:user_id]}"
    end
  render :edit
  end
end
