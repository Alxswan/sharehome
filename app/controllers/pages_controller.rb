class PagesController < ApplicationController
  
  def home

    if @current_user
  
      if @current_user.room_id

  	room_id = @current_user.room_id 
  	room = Room.find(room_id)
    home_id = room.home_id
  	@home = Home.find(home_id)
  end

  	render:dash
  end

  end

  def new_user
  end

  def join_home
  	#user has user name, address and password of home
  end
end
