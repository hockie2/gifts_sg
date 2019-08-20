class UsersController < ApplicationController

before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    # response.send("hello")
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

  def show
    @user = User.find(params[:id])
  end

  def edit
    allUser = User.all
    @users = allUser.sort_by{|user| user.id}
    @user = User.find(params[:id])

  end

  def update
    @user = user.find(params[:id])
    @user.update(user_params)
    redirect_to @user

  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :location, :encrypted_password)
  end
end