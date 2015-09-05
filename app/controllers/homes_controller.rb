class HomesController < ApplicationController

  before_action :check_if_logged_in, :only => [:index, :edit, :update]
  # before_action :check_if_admin, :only => [:index]
  before_action :check_if_house_admin, :only => [:edit]

  def new
  	@home = Home.new
  end

  def create
  	@home = Home.new home_params

  	if @home.save
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
  
  end

  def update
    home = Home.find params[:id]
    if home.authenticate(params[:home][:password])
    
    redirect_to :controller => 'rooms', :action => 'index', :id => params[:id]
    else
  redirect_to homes_path
  end
end

  def index
     @homes = Home.all
  end
  


private 

  def home_params
  	params.require(:home).permit(:address, :description, :is_house_admin, :password, :password_confirmation, :name)   	
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

end