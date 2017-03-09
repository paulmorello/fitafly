class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    if !logged_in?
      redirect_to new_user_path
    end

  end

  def create

    expire_page :action => :index

    event = Event.new
    event.title = params[:title]
    event.location = params[:location]
    event.date = params[:date]
    event.sport = params[:sport]
    event.difficulty = params[:difficulty]
    event.description = params[:description]
    event.additional_information = params[:additional_information]

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
