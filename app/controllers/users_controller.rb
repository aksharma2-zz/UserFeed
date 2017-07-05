class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		user = User.all
		render json: {user:user}	
	end

	def edit

	end

	def create
		@duplicate_user = false
		User.all.each do |user|
			@duplicate_user = user.where(username: params[:username]).exists?
		end

		if(!@duplicate_user)
			render text: 'User with '+ params[:username] + ' already exists'
		else
			new_user = User.create(username: params[:username], name: params[:name])
			render json: {user:new_user}
		end
	end

	def delete
		user = User.find_by_username(params[:username])
		
		if(user)
			User.destroy_all(username: params[:username])
			render text: 'Deleted' , json: {user:user} 
		else
			render text: 'User ' + params[:username] + ' not found'
		end
	end

end
