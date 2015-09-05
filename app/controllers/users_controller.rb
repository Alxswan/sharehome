class UsersController < ApplicationController
  
  before_action :check_if_logged_in, :only => [:index, :edit, :update]
  before_action :check_if_admin, :only => [:index]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new user_params
  	if @user.save
      session[:user_id] = @user.id
  	  redirect_to :controller =>'pages', :action => 'new_user', :id => :id

  	else
  	  render :new
  	end
  end 

  def edit
  	@user = @current_user
  end

  def update
  	@user = @current_user

  	if @user.update user_params
  		redirect_to root_path

  	else
  		render :edit
  	end
  
  end

  def destroy
  	@user = @current_user
  	@user.destroy
  	redirect_to root_path
  end 

  private 

  def user_params
    params[:user][:first_name].capitalize!
  	params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)   	
  end

  def user_params_authenticate_home
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :room_id)    
  end  

  def check_if_logged_in
  	redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
  	redirect_to root_path unless @current_user.present? && @current_user.is_admin?
  end


end
