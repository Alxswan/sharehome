class RoomsController < ApplicationController

  def edit
  end

  def index
  end

  def new
  	@room = Room.new
  end

  def create
  	home = Home.find(params[:home_id].to_i)
  	number = (params[:number]).to_i

  	number.times do
	  	room = home.rooms.create

	  	unless @current_user.room_id
	  		room.users << @current_user
	  	end
  	end

  	redirect_to root_path

  end

  def room_params
  	params.require(:room).permit(:occupant, :description, :home_id)   	
  end

end
