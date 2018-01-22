class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
    before_filter :correct_user,   only: [:edit, :update]
    before_filter :admin_user,     only: :destroy

	def destroy
    	User.find(params[:id]).destroy
    	flash[:success] = "User destroyed."
    	redirect_to users_url
  	end

    def index
    	@users = User.paginate(page: params[:page]) #User.all
    end

	def edit
		# @user = User.find(params[:id])
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
			flash[:success] = "welcome to the sample app!!!"
			redirect_to @user
		else
			render 'new'
		end
	end
	def update
		# @user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			#Handle successfull update
			flash[:success] = "profile updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	private
		def signed_in_user

			unless signed_in?
		        store_location
		        redirect_to signin_url, notice: "Please sign in."
		    end
			# unless signed_in?
			#   flash[:notice] = "Please sign in."
			#   redirect_to signin_url
			# end
	      	# redirect_to signin_url, notice: "Please sign in." unless signed_in?
	    end

	    def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_url) unless current_user?(@user)
    	end

    	def admin_user
      		redirect_to(root_url) unless current_user.admin?
    	end


end
