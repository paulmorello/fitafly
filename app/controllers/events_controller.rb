class EventsController < ApplicationController

  def index

    if @events.nil?
      # Starting at 0, will increase with greater number as user scrolls
      offset = 0
      @events = Event.limit(10).offset(offset)
    end

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
    event.sport = params[:sport].downcase
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

    # If more than 40 registrations for event, get first 40 people and display
    # count of extra people attending to save time.
    if @registrations != nil? && @registrations.count > 40
      @rsvps = @registrations.first(40)
      @user_rsvp = []

      @rsvps.each do |rsvp|
        @user_rsvp.push(User.find(id: rsvp.user_id)).uniq
      end
      @more_rsvps = "+#{@registrations.count - @rsvps.count} more people attending!"

    else
      @user_rsvp = []
      @registrations.each do |rsvp|
        @user_rsvp.push(User.where(id: rsvp.user_id)).uniq
      end

    end
  end

  def search

    sport = params[:search].downcase

    @events = Event.search_by_sport(sport)

    redirect_to '/events'

  end

end
