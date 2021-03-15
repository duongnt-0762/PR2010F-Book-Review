class LikesController < ApplicationController
	before_action :find_comment
	before_action :find_like, only: [:destroy]

	def create
		@comment.likes.create(user_id: current_user.id )
	end


	private

	def find_comment
		@comment = Comment.find(params[:comment_id])
	end
	def already_liked?
		Like.where(user_id: current_user.id, comment_id: params[:review_id].exists?)
	end
	def find_like
		@like = @comment.likes.find(params[:id])
	end

end