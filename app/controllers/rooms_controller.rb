class RoomsController < ApplicationController

  def create
    @room = Room.create(room_params)
    if @room.save
      flash[:success] = "#{@room.name} was successfully created..."
      redirect_to room_path(@room)
    else
      flash[:error] = @room.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def show
    @room = Room.find(params[:id])
    redirect_to room_messages_path(@room)
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
