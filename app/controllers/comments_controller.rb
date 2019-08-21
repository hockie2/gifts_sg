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
    @comment = Comment.find(params[:id])
      if current_user
          @users = User.find(current_user.id)
      end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    @comment.item_id = params[:id]

    if @comment.save
      redirect_to item_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to items_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to items_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end