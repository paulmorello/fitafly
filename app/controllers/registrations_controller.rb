class RegistrationsController < ApplicationController

  def create

    registration = Registration.new
    registration.user_id = current_user.id
    registration.event_id = params[:event_id]

    if registration.valid?
      if registration.save!
        redirect_to "/users/${current_user.id}"
      end
    else
      
    end
  end

end
