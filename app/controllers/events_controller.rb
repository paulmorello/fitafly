class EventsController < ApplicationController

  def index
    # Starting at 0, will increase with greater number as user scrolls
    offset = 0
    @events = Event.limit(10).offset(offset)
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
    if @registrations != nil? && @registrations.count > 100
      @rsvps = @registrations.first(100)

      @user_rsvp = []
      @rsvps.each do |rsvp|
        @user_rsvp.push(User.where(id: rsvp.user_id)).uniq
      end

      @more_rsvps = `Plus another #{@registrations.count - @rsvps.count} attending!`

    else
      @user_rsvp = []
      @registrations.each do |rsvp|
        @user_rsvp.push(User.where(id: rsvp.user_id)).uniq
      end

    end
  end

end
