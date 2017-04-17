class EventsController < ApplicationController

  def index
    @events = Event.first(10)
  end

  def new
    redirect_to_route_if_not_logged_in('users/new')

  end

  def create

    event = Event.new
    event.user_id = current_user.id
    event.title = params[:title]
    event.location = params[:location]
    event.date = Time.now.to_s.slice(0,10)
    event.sport = params[:sport]
    event.difficulty = params[:difficulty]
    event.description = params[:description]
    event.additional_information = params[:additional_information]

    if event.save!
      redirect_to '/events'
    else
      render :new
    end

  end

  def show

    @event = current_event
    @registrations = Registration.where(event_id: params[:id])

    @user_rsvp = []
    if @registrations != nil
      @registrations.each do |rsvp|
        @user_rsvp.push(User.where(id: rsvp.user_id)).uniq
      end
    end

  end

end
