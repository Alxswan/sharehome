class RecordsController < ApplicationController
  def new
  	@record = Record.new
  end

  def create
  	@record = Record.new record_params

  	if @record.save
  	  redirect_to records_path
  	else
  	  render :new
  	end
  end

  def index
  	@records = Record.where(:home_id => @current_user.home.id)
  end

  def edit
  	@record = Record.find params[:id]

  end
  def update
  	@record = Record.find params[:id]
  	@record.update record_params
  	redirect_to records_path
  end

  def destroy
  	@record = Record.find params[:id]
  	@record.destroy
  	redirect_to records_path
  end


  private
  def record_params
  params.require(:record).permit(:move_in, :move_out, :home_id, :first_name)
	end
end
