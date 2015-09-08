class HomesController < ApplicationController

  before_action :check_if_logged_in, :only => [:index, :edit, :update]
  # before_action :check_if_admin, :only => [:index]
  before_action :check_if_house_admin, :only => [:destroy]
  before_action :check_if_belongs_to_home, :only => [:show]

  def new
  	@home = Home.new
  end

  def create
  	@home = Home.new home_params

  	if @home.save
      @current_user.update(:is_house_admin => true)
  	  redirect_to :controller => 'rooms', :action => 'new', :home_id => "#{@home.id}"
  	else
  	  render :new
  	end
  end

  def show
    @home = Home.find params[:id]
    @rooms = @home.rooms
  end

  def edit
     @home = Home.find params[:id]
     @rooms = @home.rooms
  end

  def update
    home = Home.find params[:id]

    if home.rooms && @current_user.room
      home.update home_params 
      flash[:message] = "Changes saved."
      redirect_to home
    else

      if home.authenticate(params[:home][:password])
        flash[:message] = "Successfully joined #{home.name}"
        redirect_to :controller => 'rooms', :action => 'index', :id => params[:id]

      else
        flash[:message] = "Invalid email or password. Please try again."
        redirect_to edit_home_path
      end 
    end
  end

  def index
     @homes = Home.all
     if params[:search]
     @homes_results = Home.where("name ILIKE ? OR address ILIKE ?", "%#{ params[:search] }%", "%#{ params[:search] }%")
    else
      @homes_results = []
      end
  end

  def results      
  end

  
  def destroy
    @home = Home.find params[:id] 
    @home.destroy
    flash[:message] = "Home destroyed"
    redirect_to root_path
  end

private 

  def home_params
  	params.require(:home).permit(:address, :description, :password, :password_confirmation, :name)   	
  end

  def check_if_logged_in
  	redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
  	redirect_to root_path unless @current_user.present? && @current_user.is_admin?
  end

  def check_if_house_admin
  	redirect_to root_path unless @current_user.present? && @current_user.is_house_admin?
  end

  def check_if_belongs_to_home
    redirect_to root_path unless @current_user.present? && (@current_user.room.home.id == params[:id].to_i if @current_user.room && @current_user.room.home)
    end

end