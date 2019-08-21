class CommentsController < ApplicationController
  def index
    if current_user
            @users = User.find(current_user.id)
        end
  end

  def show
  end

  def new
    if current_user
            @users = User.find(current_user.id)
        end
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end