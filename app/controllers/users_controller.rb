class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to FamTime community, " + @user.first_name
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated successfully!"
      redirect_to user_path(@user)
    else 
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :last_name, :password, :address, :tel)
  end
  
  def set_user
    @user = User.find_by_id(params[:id])
  end
end
