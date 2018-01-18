class UsersController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:sucess] = "welcome to the sample app!!!"
			redirect_to @user
		else
			render 'new'
		end
	end
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			#Handle successfull update
		else
			render 'edit'
		end
	end

end
