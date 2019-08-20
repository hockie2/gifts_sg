class UsersController < ApplicationController

before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    # response.send("hello")
  end


  def new
    # allKopi = Kopi.all
    # @kopis = allKopi.sort_by{|kopi| kopi.id}
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
    # allKopi = Kopi.all
    # @kopis = allKopi.sort_by{|kopi| kopi.id}
    # @customer = Customer.find(params[:id])

  end

  def update
    # @customer = customer.find(params[:id])
    # @customer.update(customer_params)
    # redirect_to @customer

  end

  def destroy
    # @customer = customer.find(params[:id])
    # @customer.destroy
    # redirect_to customers_path
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :location, :encrypted_password)
  end
end