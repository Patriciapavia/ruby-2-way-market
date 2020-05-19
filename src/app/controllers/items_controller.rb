class ItemsController < ApplicationController
before_action :authenticate_user!
 before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
  	@items = Item.all
    @order_items = current_order.order_items.new
    if params[:category].blank?
    @items = Item.all
  else
    @category_id = Category.find_by(name: params[:category]).id
      @items = Item.where(:category_id => @category_id)
   end

  end

  def new
  	 @item =  current_user.items.create
      #@oder_items = OrderItem.current_order.order_item.new
     
     @categories = Category.all.map{ |c| [c.name, c.id] } 
  end

  def create
   # @oder_items = OrdertIem.current_order.order_item.create(item_params)
  	@item = current_user.items.create(item_params)
     @item.category_id = params[:category_id]
  	if @item.save
  		redirect_to items_path
  	else
  		render "new"
  	end

  end

  def show

   

   @items = Item.where(:category_id => @category_id)
   
   @comments = Comment.all
   
   @order_item = current_order.order_items.new
  end

  def update
     @item.category_id = params[:category_id] 
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
   	params.require(:item).permit(:title, :description, :size, :color, :price, :category, :quantity, :order_item_id, :image)
   	
   end

   
end
