class PostsController < ApplicationController

	def index
		post = Post.all
		render json: {post:post}
	end

	def showPost
		post = Post.find(params[:post_id])
		render json: {post:post}
	end

	def delete
		user_id = params[:user_id]
		post_id = params[:post_id]
	end

end
