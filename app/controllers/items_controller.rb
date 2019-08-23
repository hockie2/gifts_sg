class ItemsController < ApplicationController
	  	before_action :authenticate_user!, :except => [ :show, :index ]

      def index
        @search = true
        @items = Item.search(params[:term])

          if current_user
             @users = User.find(current_user.id)
          end
	  end

	  def show
    	  @item = Item.find(params[:id])
          @reserve = Reserve.find{|x| x.item_id == params[:id].to_i}
          @categories = Category.all
          @comments = Comment.where(item_id: params[:id].to_i).all.order('id DESC')

            if current_user
                @users = User.find(current_user.id)
            end

	  end

	  def new
	  	@categories = Category.all

      if current_user
            @users = User.find(current_user.id)
        end

	  end

	  def edit
	  	@item = Item.find(params[:id])
	  	@categories = Category.all
        if current_user
            @users = User.find(current_user.id)
        end
	  end

	  def create
	  	@item = Item.new(item_params)
	  	uploaded_file = params[:item][:picture].path

	  	# if params[:preloved] == 'true'
	  	# 	@item.preloved = true
	  	# else
	  	# 	@item.preloved = false
	  	# end

  		cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

  		@item.public_id = cloudnary_file["public_id"]
        @item.user_id = current_user.id


	    if @item.save
	      redirect_to @item
	    else
	    	@categories = Category.all
	    	@users = User.find(current_user.id)
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
         @user = User.find(current_user.id)
      	end
	    @reserve = Reserve.new

	    @reserve.item_id = @item.id
	    @reserve.user_id = @user.id
	     puts "+++++++++++++++"
	     puts @reserve.id

	    @reserve.save
	    if @item.save
	    	redirect_to items_path
	    end
	  end


	  def release
	  	@item = Item.find(params[:id])
	  		puts "+++++++++++"
	  		puts  @item. availability
	    @item.availability = "Available"
	    if current_user
         @user = User.find(current_user.id)
      	end

	    @reserve = @item.reserve
	    @reserve.destroy

	   	if @item.save
	    	redirect_to @user
	    end
	  end

	  def done
	  	@item = Item.find(params[:id])
	    if current_user
         @user = User.find(current_user.id)
      	end
	    # @reserve = @item.reserve
	    # @reserve.destroy
	    @item.availability = "closed"
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
	    params.require(:item).permit(:name, :description, :preloved, :availability, :public_id, :category_id, :term)
	  end


end