class BillsController < ApplicationController
  def new
  	@bill = Bill.new
    @users = @current_user.home.users
  end

  def create
    bill_details = bill_params
    @users = @current_user.home.users

    if params[:file]
      response = Cloudinary::Uploader.upload params[:file]
      bill_details["image"] = response["url"]
    end
    
  	@bill = Bill.new bill_details

  	if @bill.save
  	  redirect_to bills_path
  	else
  	  render :new
  	end
  end

  def edit
  	@bill = Bill.find params[:id]
  end

  def index
  	@home = @current_user.home
  end

  def show
  	@bill = Bill.find params[:id]
  end

  def update
  	@bill = Bill.find params[:id]
  	@bill.update bill_params
  	redirect_to @bill
  end

  def destroy
  	@bill = Bill.find params[:id]
  	@bill.destroy
  	redirect_to bills_path
  end

  def split
    @bill = Bill.find params[:id]
    @home = @bill.home
    @owner = @bill.user.first_name
    @records = Record.where(:home_id => @bill.home.id)

    @days_in_bill = (@bill.bill_end - @bill.bill_start).to_i if @bill.bill_start && @bill.bill_end
    @total_housemate_days_in_bill = 0

    @home.users.each do |user|
      if !user.moved_in
        flash[:message] ="No move in date available for #{user.first_name}. Please update"
        redirect_to home_path(@current_user.home) and return
      else
        user_days_in_bill = (@bill.bill_end - user.moved_in).to_i if user.moved_in && @bill.bill_start
        user_days_in_bill = 0 if user_days_in_bill < 0
        user_days_in_bill = @days_in_bill if user_days_in_bill >= @days_in_bill
        @total_housemate_days_in_bill += user_days_in_bill 
      end
    end
    
    @records.each do |record|
      if record.move_in && record.move_out
        user_days_in_bill = (record.move_out - @bill.bill_start).to_i if record.move_out && @bill.bill_start
        user_days_in_bill = 0 if user_days_in_bill < 0
        user_days_in_bill = @days_in_bill if user_days_in_bill >= @days_in_bill
        @total_housemate_days_in_bill += user_days_in_bill

      else
        flash[:message] ="No move in date available for #{record.first_name}. Please update"
        redirect_to edit_record_path(record) and return
      end

  end
end

  def simple

    @bill = Bill.find params[:id]
    @home = @bill.home
    if params[:count]
      @count = params[:count].to_i
    else
      @count = @home.users.count
    end
    @owes = @bill.amount / @count
    @owner = @bill.user.first_name

  end

  private
  def bill_params
    params[:bill][:user_id] = params[:bill][:user_id].to_i if params[:user_id]
  	params.require(:bill).permit(:name, :bill_type, :amount, :bill_start, :bill_end, :home_id, :user_id)   	
  end
end
