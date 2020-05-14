class OrderItemsController < ApplicationController

	def create

        @order = current_order
        @order.save
        @order_item = @order.order_items.create(order_params)
        session[:order_id] = @order.id
        #redirect_to item_path(item.id)
        
        #OrderItem.create(item_id: params[:item_id], order_id: params[:order_id])
          
        # @order = current_order
        # @item =  current_user.items.create
        # @order.save
        # @order_item = @order.order_items.new(order_params)
        # puts @order_item.errors.any?
        # @order.save
        # session[:order_id] = @order.id
        # redirect_to items_path
    
end



    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_params)
        @order_items = current_order.order_items
    end

    def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = current_order.order_items
    end



    private

    def order_params
        params.require(:order_item).permit(:item_id, :quantity, :user_id)
    end
end
