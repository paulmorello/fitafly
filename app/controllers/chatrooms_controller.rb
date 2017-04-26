class ChatroomsController < ApplicationController

  def index
    @users = User.all
    @chatrooms = Chatroom.all
  end

  def create

    if Chatroom.between(params[:sender_id],params[:recipient_id]).present?
      @chatroom = Chatroom.between(params[:sender_id], params[:recipient_id]).first
    else
      @chatroom = Chatroom.create!(chatroom_params)
    end

    redirect_to chatroom_messages_path(@chatroom)

  end

  private

    def chatroom_params
      params.permit(:sender_id, :recipient_id)
    end

end
