class ReservesController < ApplicationController
	 def new

	  	@item = Item.find(params[:id])
	  	if current_user
         @user = User.find(current_user.id)
      	end

	  end

end
