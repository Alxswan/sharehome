class ChecklistsController < ApplicationController
	 def new
  	@checklist = Checklist.new
  end

  def create
  	@checklist = Checklist.new checklist_params
  	if @checklist.save
  	  redirect_to '/#checklist'
  	else
  	  render :new
  	end
  end

  def index
  	@checklists = Checklist.where(:home_id => @current_user.home.id)
  end

  def edit
  	@checklist = Checklist.find params[:id]

  end
  def update
  	@checklist = Checklist.find params[:id]
  	@checklist.update checklists_params
  	redirect_to checklists_path
  end

  def destroy
  	@checklist = Checklist.find params[:id]
  	@checklist.destroy
  	redirect_to '/#checklist'
  end

  private
  def checklist_params
  params.require(:checklist).permit(:home_id, :bill_id, :meeting_id, :name)
	end
end
