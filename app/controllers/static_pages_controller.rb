class StaticPagesController < ApplicationController
  def about
  	if current_user
     @users = User.find(current_user.id)
  	end
  end

  def contactUs
	if current_user
     	@users = User.find(current_user.id)
 	end
  end
end
