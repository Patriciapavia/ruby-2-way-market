class ItemsController < ApplicationController


  def index
  	@item = Item.all
  end

  def new
  	 @item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to root_path
  	else
  		render "new"
  	end

  end


   private
   def item_params
   	params.require(:item).permit(:title, :description, :size, :color, :price)
   	
   end

end
