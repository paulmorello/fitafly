class MessagesChannel < ApplicationCable::Channel
  # Responsible for subscribing to and streaming messages
  def subscribed
    stream_from 'messages'
  end
end
