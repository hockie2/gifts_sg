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
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    @comment.item_id = params[:id]

    puts "logging comment"
    puts params[:id].to_i

    if @comment.save
      redirect_to items_path
    end
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end