class ReservesController < ApplicationController

      def index
        @resevers = Reserve.all
        if current_user
         @users = User.find(current_user.id)
      	end

	  end

	  def show
	  	if current_user
         @users = current_user
         
      	end

	  end

	  def new
	  	if current_user
         @users = User.find(current_user.id)
      	end

      	@item = Item.find(params[:id])

	  end

	  def create
	  	@reserve = Reserve.new(reserve_params)
	    if @reserve.save
	      redirect_to "/items"
	    else
	      render 'new'
	    end
	  end
	 

	  def destroy
	  	@item = Item.find(params[:id])
	    @item.destroy
	    redirect_to "/items"
	  end


	 # def reserve
	 #  	@item = Item.find(params[:id])
	 #  	@item.availability = reserved
	 #  	@user = current_user
	 #    @item.update(params[:availability ])
	 #    redirect_to "/items"
	 #  end
	 

	 

	private

	  def item_params
	    params.require(:reserve).permit(:user_id, :item_id)
	  end



end




