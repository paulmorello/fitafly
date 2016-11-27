class EventsController < ApplicationController

  def index
    if !!session[:user_id]
      redirect_to 'users/home'
    end
    
    @events = Event.all
  end

  def new
  end

  def create

    event = Event.new
    event.title = params[:title]
    event.date = params[:date]
    event.sport = params[:sport]
    event.description = params[:description]

    if event.save
      redirect_to '/'
    else
      render :new
    end

  end

  def show

    @event = Event.find_by(id: params[:id])

  end

end
