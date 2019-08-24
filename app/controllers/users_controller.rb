class UsersController < ApplicationController

before_action :authenticate_user!, :except => [:index ]

  def index
    
  end

  def new
    allUser = User.all
    @users = allUser.sort_by{|user| user.id}
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def edit
    allUser = User.all
    @users = allUser.sort_by{|user| user.id}
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user

  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def show
    instance_variable_set
  end

  def reservedItems
    instance_variable_set
  end

  def availableItems
    instance_variable_set
  end

  def closedItems
    instance_variable_set
  end

  def myReservedItems
    instance_variable_set
  end



private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :location, :encrypted_password)

  end

  def instance_variable_set
    @items_reserved = Item.select{|item| item.user_id == params[:id].to_i && item.availability == "reserved"}
    @items_available = Item.select{|item| item.user_id == params[:id].to_i && item.availability == "Available"}
    @items_closed = Item.select{|item| item.user_id == params[:id].to_i && item.availability == "closed"}
    @user = User.find(params[:id])
    @users= User.find(params[:id])
    @reservedItems = Reserve.select{|item| item.user_id == params[:id].to_i}
    @myReservedItems = @reservedItems.map{|e| e.item}.sort_by {|item| item.availability}.reverse
  end

end