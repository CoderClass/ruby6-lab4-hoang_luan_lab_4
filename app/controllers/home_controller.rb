class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
  end

  def logout
    session[:username] = nil
    redirect_back fallback_location: root_path
  end

  def login
    session[:username] = params[:username].presence
    redirect_back fallback_location: root_path
  end
end
