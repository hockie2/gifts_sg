class ItemsController < ApplicationController
	  	before_action :authenticate_user!, :except => [ :show, :index ]

      def index
        @items = Item.all.sort
            if current_user
             @users = User.find(current_user.id)
          end

	  end

	  def show
	  	@item = Item.find(params[:id])

	  	@categories = Category.all

        if current_user
            @users = User.find(current_user.id)
        end

	  end

	  def new

	  	@categories = Category.all

	  end

	  def edit
	  	@item = Item.find(params[:id])
	  	@categories = Category.all
	  end

	  def create
	  	@item = Item.new(item_params)

	  	uploaded_file = params[:item][:picture].path
     
  		cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
  		
  		@item.public_id = cloudnary_file["public_id"]
      @item.user_id = current_user.id
  	
	    if @item.save
	      redirect_to @item

	    else
	    	@categories = Category.all

	      render 'new'

	    end
	  end


	  def update
	  	@item = Item.find(params[:id])
	    @item.update(item_params)
	    redirect_to @item
	  end

	  def reserve
	  	@item = Item.find(params[:id])
	    @item.availability = "reserved"
	    if current_user
         @users = User.find(current_user.id)
      	end
	    @reserve = Reserve.new
	    @reserve.save

	    if @item.save
	    	redirect_to items_path
	    end

	  end


	  def destroy
	  	@item = Item.find(params[:id])
	    @item.destroy
	    redirect_to "/items"
	  end

	private

	  def item_params
	    params.require(:item).permit(:name, :description, :preloved, :availability, :public_id,  :category_id)
	  end



end

