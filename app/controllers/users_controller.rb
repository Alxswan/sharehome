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
  	@user = User.find params[:id]
    @housemate = User.find params[:id]
  end

  def update

  	@user = @current_user
    @housemate = User.find params[:id]
    create_record

    if params[:user][:room_id] == "nil"
      params[:user][:room_id] = nil
    end

    if @housemate == @user   
      if @user.update user_params
    		redirect_to home_path
      else
        render :edit
      end
    end

    if @housemate != @user
     @housemate.update housemate_params
      redirect_to :controller => 'homes', :action => 'show', :id => "#{@current_user.home.id}"
    end
  end

  def show
    @user = User.find params[:id]
  end


  def destroy
  	@user = @current_user
  	@user.destroy
  	redirect_to root_path
  end 

  private 

  def user_params
    params[:user][:first_name].capitalize! if params[:user] && params[:user][:first_name]
  	params.require(:user).permit(:email, :first_name, :last_name, :phone, :birthday, :moved_in, :password, :password_confirmation, :room_id, :paypal_me)   	
  end

  def housemate_params
    params.require(:user).permit(:moved_in, :room_id) 
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

  def check_if_current_user
    redirect_to root_path unless @current_user.id == params[:id].to_i
  end

  def create_record
    if params[:user][:room_id] && params[:user][:room_id] = "nil"
      r = Record.create
      @housemate.records << r
      @housemate.home.records << r
      @housemate.room.records << r
      r.move_in = @current_user.moved_in if @current_user.moved_in
      r.move_out = params[:move_out] || Time.now
      r.first_name = @housemate.first_name
      r.save
    end
  end
end
