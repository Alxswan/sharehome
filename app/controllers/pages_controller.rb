class PagesController < ApplicationController
  def home

  	room_id = @current_user.room_id
  	home_id = Room.find(room_id)
  	home = Home.find(home_id)

  	if home.users == 1
  		render :invite
  	end

  end

  def new_user
  end

  def join_home
  	#user has user name, address and password of home
  end
end
