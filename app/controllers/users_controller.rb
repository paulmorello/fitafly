class UsersController < ApplicationController

  def home
    if logged_in?
      redirect_to '/events'
    end
    
  end

  def new
    if logged_in?
      redirect_to '/events'
    end

  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/events'
    else

      render :new
    end
  end

  def show
    @host_event = Event.where(user_id: current_user.id)

  end

  def edit
    if !logged_in?
      redirect_to '/'
    end

    @user = User.find(params[:id])
  end

  def update
    if !logged_in?
      redirect_to '/'
    end

    @user = User.find(params[:id])
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
