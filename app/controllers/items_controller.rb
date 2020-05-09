class ItemsController < ApplicationController
 before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
  	@items = Item.all
  end

  def new
  	 @item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to items_path
  	else
  		render "new"
  	end

  end

  def show
    
    

  end


   private

   def find_item
    @item = Item.find(params[:id])
   end


   def item_params
   	params.require(:item).permit(:title, :description, :size, :color, :price)
   	
   end

   
end
