class HomeController < ApplicationController
    def index
        if current_user
         @users = User.find(current_user.id)

       else
         redirect_to root_path
       end
    end
end
