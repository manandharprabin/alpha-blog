class UsersController < ApplicationController
	def new
		@user = User.new	
	end

	def create
		#debugger
		@user = User.new (user_params)
		if @user.save
			flash[:success] = "Welcome to the alpha blog #{@user.user_name}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your Account is successfully updated."
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	private
		def user_params
			params.require(:user).permit(:user_name,:email,:password)
		end
end