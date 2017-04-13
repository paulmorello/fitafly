class UsersController < ApplicationController

  def home
    redirect_to_route_if_logged_in('events')

  end

  def new
    redirect_to_route_if_logged_in('events')

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
    redirect_to_route_if_not_logged_in

    @user = current_user
  end

  def update
    redirect_to_route_if_not_logged_in

    @user = current_user
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
