class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def user_params
    params.require(:user_info).permit(:first_name, :email, :last_name, :password, :address, :tel)
  end
end
