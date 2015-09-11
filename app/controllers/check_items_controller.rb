class CheckItemsController < ApplicationController
	 def new
  	@check_item = CheckItem.new
  end

  def create
  	@check_item = CheckItem.new check_item_params
  	if @check_item.save
  	  redirect_to '/#checklist'
  	else
  	  render :new
  	end
  end

  def index
  	@check_items = CheckItem.where(:home_id => @current_user.home.id)
  end

  def edit
  	@check_item = CheckItem.find params[:id]

  end
  def update
  	@check_item = CheckItem.find params[:id]
  	@check_item.update check_item_params
  	redirect_to '/#checklist'
  end

  def destroy
  	@check_item = CheckItem.find params[:id]
  	@check_item.destroy
  	redirect_to '/#checklist'
  end

  private
  def check_item_params
  params.require(:check_item).permit(:user_id, :task, :checklist_id)
	end
end
