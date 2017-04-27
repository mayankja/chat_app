class MessagesController < ApplicationController

  def index
    @send_messages =  current_user.send_messages
    @received_messages = current_user.received_messages
  end
  
  def new
    @message =  Message.new()
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to messages_path
    else
      render 'new'
    end

  end

  private 

  def message_params
    params.require(:message).permit(:body, :recipient_id).merge({sender_id: current_user.id})
  end
end
