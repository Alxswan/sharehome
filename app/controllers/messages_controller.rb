class MessagesController < ApplicationController
  def show
  end

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

  def update
  end

  def destroy
  end

  private
  def message_params
  	params.require(:message).permit(:message) 
  end
end
