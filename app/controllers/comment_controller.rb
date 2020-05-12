class CommentController < ApplicationController
	def create
        
        Comment.create(user_id: current_user.id, item_id: params[:item_id], text_field: params[:text_field])
        redirect_to item_path(params[:item_id])
        
    end
end
