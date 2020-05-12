class ItemsController < ApplicationController
 before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
  	@items = Item.all
  end

  def new
  	 @item =  current_user.items.create
     @categories = Category.all.map{ |c| [c.name, c.id] } 
  end

  def create
  	@item = current_user.items.create(item_params)
     @item.category_id = params[:category_id]
  	if @item.save
  		redirect_to items_path
  	else
  		render "new"
  	end

  end

  def show
    

  end

  def update
    @categories = Category.all.map{ |c| [c.name, c.id] }
    if @item.update(item_params)
      redirect_to items_path
    else
      render "edit"
    end
    
  end


   def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
     
   end
   
  def destroy
  Item.find(params[:id]).destroy
   redirect_to items_path
      
    
  end


   private

   def find_item
    @item = Item.find(params[:id])
   end


   def item_params
   	params.require(:item).permit(:title, :description, :size, :color, :price, :category)
   	
   end

   
end
