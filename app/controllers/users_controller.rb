class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token


	def new
		render template: "users/new_user"
	end

	def index
		@user = User.all
		render template: "users/show"
	end

	def handleEdit
		@user = User.find(id:params[:user_id])
		@user.name = params[:name]
		@user.email = params[:email]
		@user.password = params[:password]
		@user.save!
		render text: "Hi"
	end

	def edit
		@user = User.find(params[:id])
		render template: "users/edit_user"
	end

	def show
		@user = User.find(params[:id])
		puts @user
		render template: "users/show_user"
	end

	def create
		@duplicate_user = false
		User.all.each do |user|
			@duplicate_user = user.username == params[:username]
			if(@duplicate_user == true)
				break
			end
		end

		if(@duplicate_user == true)
			render text: 'User with '+ params[:username] + ' already exists'
		else
			@new_user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])

		end

		if(!@new_user.valid?)
				render template: "shared/error_messages"

		else

			if @new_user.save!
				flash[:success] = "Welcome to the Sample App!"
				redirect_to @new_user
				#render json: {user:@new_user}
			end
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

	def login
		render template: '/users/login'
	end

end
