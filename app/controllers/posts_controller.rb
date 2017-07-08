class PostsController < ApplicationController
 	

	def index
		posts = Post.find_by_user_id(current_user.id)
		render template: '/posts/show_posts'
	end

	def create
		@post = current_user.posts.new(heading: params[:heading], content: params[:content])
		if @post.save
			flash[:success] = 'Post created'
		else
			flash[:danger] = 'Unsuccesful'
			render template: 'shared/error_messages'
		end
	end

	def destroy
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

end
