class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create

    expire_page :action => :index

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
