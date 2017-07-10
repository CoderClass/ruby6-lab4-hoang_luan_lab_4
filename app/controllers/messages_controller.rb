class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @messages = @room.messages
    
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @room.messages }
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    @message.username = current_user

    if @message.save
      render 'index'
    else
      flash.now[:error] = @message.errors.full_message.to_sentences
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
