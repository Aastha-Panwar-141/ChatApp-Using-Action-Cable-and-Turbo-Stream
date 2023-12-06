class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    # ActionCable.server.broadcast "chat", message: data["message"]
    # ActionCable.server.broadcast(
    #   "chat_#{room}",
    #   {
    #     sent_by: 'Aastha',
    #     body: 'This is a cool chat app.'
    #   }
    # )
    ActionCable.server.broadcast("chat_#{params[:room]}", data)

    
  end

end
