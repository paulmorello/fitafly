class SessionController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/events'
    else
      render :new
    end
  end

  def destroy

    session[:user_id] = nil
    redirect_to '/'
  end

end
