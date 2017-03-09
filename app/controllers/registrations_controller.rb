class RegistrationsController < ApplicationController

  def create

    registration = Registration.new
    registration.user_id = params[:user_id]
    registration.event_id = params[:event_id]

    if registration.save
      redirect_to users_path
    end
  end

end
