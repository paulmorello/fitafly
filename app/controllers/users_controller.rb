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

      redirect_to '/events'
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

    @user = User.find_by(session[:user_id])
    @user.email = params[:email]
    @user.username = params[:username]
    if params[:password] != ''
      @user.password = params[:password]
    end

    if @user.save
      flash[:success] = "Your account was updated successfully"
      return redirect_to user_path
    end
    render :edit
  end

end
