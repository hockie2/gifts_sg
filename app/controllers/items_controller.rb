class ItemsController < ApplicationController

	  	before_action :authenticate_user!, :except => [ :show, :index ]

      def index
        @items = Item.all
            if current_user
             @users = User.find(current_user.id)
          end
	  end

	  def show
	  	@item = Item.find(params[:id])
	  	@categories = Category.all

	  end

	  def new

	  	@categories = Category.all

	  end

	  def edit
	  	@item = Item.find(params[:id])
	  end

	  def create
	  	puts "+++++++++++++++++************"

	  	puts params.inspect
	  	puts "+++++++++++++%%%%%%%%%%%%%"
	  	puts item_params.inspect

	  	@item = Item.new(item_params)

	  	uploaded_file = params[:item][:picture].path


  		cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
  		puts cloudnary_file["public_id"]
  		@item.public_id = cloudnary_file["public_id"]
  		puts "++++++++++++++++++++++++++++++++++++++++++++"
	  puts cloudnary_file.inspect
	    if @item.save
	      redirect_to @item

	    else
	    	@categories = Category.all
		puts "==============++++++++++++"
	      render 'new'

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
	    params.require(:item).permit(:name, :description, :preloved, :availability, :public_id,  :category_id)
	  end


end
