class RoomsController < ApplicationController

  def index
    @home = Home.find params[:id]
    @rooms = @home.rooms
  end

  def new
  	@room = Room.new
  end

  def create
  	home = Home.find(params[:home_id].to_i)
  	number = (params[:number]).to_i

  	number.times do
	  	room = home.rooms.create
    end

      user_room = home.room.first
	  	user_room.users << @current_user
      user_room.occupant = @current_user.first_name
      room.save
	  	
  	

  	redirect_to root_path 

  end

  def edit
  end

  def update 
    @room = Room.find params[:id]
    @room.users << @current_user
    @room.update(:occupant => "#{@current_user.first_name}")
    redirect_to root_path
  end

  private

  def room_params
  	params.require(:room).permit(:occupant, :description, :home_id)   	
  end

end
