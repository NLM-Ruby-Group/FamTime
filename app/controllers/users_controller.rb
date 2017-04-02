class UsersController < ApplicationController
	before_action :authenticate_user, except: [:new, :create, :confirm_email]
	before_action :set_user

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			UserMailer.registration_confirmation(@user).deliver_now
			flash[:success] = "A confirmation email was sent, please activate your account: " + @user.first_name
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
    puts 'Hello >'
		user = User.find_by_confirm_token(params[:id])
    puts user.email
    puts 'World >'
		if user
			user.email_activate
			flash[:success] = "Your account is activated, please login to continue"
			redirect_to new_session_path 
		else
			flash[:error] = "Sorry. User does not exist"
			#redirect_to root_path
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
