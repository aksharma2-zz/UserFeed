class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		user = User.all
		render json: {user:user}
		
	end

	def create
		new_user = User.create(username: params[:username], name: params[:name])
		render json: {user:new_user}
	end

	def delete
		user = User.find_by_username(params[:username])
		User.destroy_all(username: params[:username])
		
		if(user)
			render text: 'Deleted' , json: {user:user} 
		else
			render text: 'User ' + params[:username] + ' not found'
		end

	

	end
end
