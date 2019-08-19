class ItemsController < ApplicationController
	  def index
	  	before_action :authenticate_user!, :except => [ :show, :index ]
	  	@items = Item.all 
	  	
	  end

	  def show
	  	@item = Item.find(params[:id])
	  end

	  def new

	 
	  end

	  def edit
	  	@item = Item.find(params[:id])
	  end

	  def create
	  # 	@kopi = Kopi.new(kopi_params)
		
	  #   @kopi.user = current_user

	  #   if @item.save
	  #     redirect_to @item
	     
	  #   else
	  #   	@farms = Farm.all
		
			# @roasts =Roast.all

	  #     render 'new'
	      
	    end
	  end

	  def update
	  	@item = Item.find(params[:id])
	    @item.update(item_params)
	    redirect_to @item
	  end


	  def destroy
	  	@item = Item.find(params[:id])
	    @item.destroy
	    redirect_to root_path
	  end
	


	private

	  def item_params
	    params.require(:item).permit(:name, :description, :preloved, :availability, :public_id)
	  end

	  
end
