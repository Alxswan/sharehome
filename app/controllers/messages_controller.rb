class MessagesController < ApplicationController

  def new
  	@message = Message.new 
  end

  def create
  	@message = Message.new message_params

  	if @message.save
  	  redirect_to '/'
  	else
  	  render :new
  	end
  end

  def destroy
  	@message = Message.find params[:id]
  	@message.destroy
  	redirect_to '/'
  end

  private
  
  def message_params
  	params[:message][:home_id].to_i
  	params[:message][:user_id].to_i
  	params.require(:message).permit(:message, :home_id, :user_id) 
  end
end
