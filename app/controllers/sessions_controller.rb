require 'bcrypt'


class SessionsController < ApplicationController
	include SessionsHelper

	def new
		render template: 'sessions/new'
	end

    def create
		# @password_digest = BCrypt::Password.create(params[:password])
		@user = User.find_by_username(params[:session][:username])

		if @user && @user.authenticate(params[:session][:password])
			flash[:success] = "Succesfully authenticated"
			puts @user.id
			log_in @user
			redirect_to @user
			#redirect_to url_for(:controller => :users, :action => :show, id: @user.id)
			
			
			puts "success"
		else
			flash[:danger] = "Username or password incorrect"
			puts "failure"
			redirect_to login_path
		end
    end

	def destroy
		logout if logged_in?
		redirect_to login_url
	end

end
