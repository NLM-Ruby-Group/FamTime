class UsersController < ApplicationController
	before_action :authenticate_user, except: [:new, :create]
	before_action :set_user

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			UserMailer.registration_confirmation(@user).deliver
			flash[:success] = "Welcome to FamTime community," + @user.first_name
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(@user)
		else 
			flash[:error] = @user.errors.full_messages.to_sentence
			redirect_to user_path(@user)
		end
	end



	def confirm_email
		user = User.find_by_confirm_token(params[:id])
		if user
			user.email_activate
			flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
			Please sign in to continue."
			redirect_to new_session_path 
		else
			flash[:error] = "Sorry. User does not exist"
			redirect_to root_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :email, :last_name, :password, :address, :tel, :photo)
	end

	def set_user
		@user = User.find_by_id(params[:id])
	end
end
