class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		session[:user_id] = user.id
		if user && user.authenticate(params[:session][:password])
			flash[:success] = "You have succesfully logged in."
			redirect_to user_path(user)
		else
			flash.now[:danger] = "Your information detail is wrong."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You are logged out."
		redirect_to root_path
	end

end