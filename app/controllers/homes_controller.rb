class HomesController < ApplicationController

  before_action :check_if_logged_in, :only => [:index, :edit, :update]
  before_action :check_if_admin, :only => [:index]
  before_action :check_if_house_admin, :only => [:edit, :update]

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

  end

  def edit
  
  end

  def index
  
  end
  


private 

  def home_params
  	params.require(:home).permit(:address, :description, :is_house_admin, :password, :password_confirmation)   	
  end

  def check_if_logged_in
  	redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
  	redirect_to root_path unless @current_user.present? && @current_user.is_admin?
  end

  def check_if_house_admin
  	redirect_to_root_path unless @current_user.present? && @current_user.is_house_admin?
  end

end