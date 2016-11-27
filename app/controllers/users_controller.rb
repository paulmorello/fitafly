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

end
