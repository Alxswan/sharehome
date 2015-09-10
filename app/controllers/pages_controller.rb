class PagesController < ApplicationController
  before_action :check_if_logged_in, :only => [:index, :edit, :update, :new]

  def home
    if @current_user
  
      if @current_user.room_id
        home_id = @current_user.room.home_id if @current_user.room
      	@home = Home.find_by_id(home_id)
      end

      @message = Message.new
      @messages = Message.where(:home_id => @current_user.home.id).order(:created_at =>:desc).limit(5) if @current_user.home
  	  render :dash    
    end
  end

  private
  def message_params
    params.require(:message).permit(:post) 
  end
end
