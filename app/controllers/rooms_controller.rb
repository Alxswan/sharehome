class RoomsController < ApplicationController

    before_action :check_if_belongs_to_home, :only => [:show, :edit]


  def index
    @home = Home.find params[:id]
    @rooms = @home.rooms
  end

  def show
    @room = Room.find params[:id]

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

      user_room = home.rooms.first
	  	user_room.users << @current_user
      user_room.occupant = @current_user.first_name
      user_room.save
	  	
  	

  	redirect_to root_path 

  end

  def edit
    @room = Room.find(params[:id])
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

   def check_if_belongs_to_home
    redirect_to root_path unless @current_user.present? && (@current_user.room.home.id == Room.find_by_id(params[:id].to_i).home.id if @current_user.room.home && Room.find_by_id(params[:id].to_i).home)
    end

end
