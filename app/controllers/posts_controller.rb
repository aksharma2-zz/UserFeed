class PostsController < ApplicationController

	def index
		post = Post.all
		render json: {post:post}
	end

	def edit

	end

	def showPost
		post = Post.find(params[:post_id])
		render json: {post:post}
	end

	def delete
		user_id = params[:user_id]
		post_id = params[:post_id]
		user = User.find(user_id)
		post = Post.find(post_id)

		if(user && post)
			Post.destroy(post_id)
		else
			render text: "User or Post not found"
	end

end
