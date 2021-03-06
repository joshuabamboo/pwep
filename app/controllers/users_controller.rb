class UsersController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.admin = true if @user.email == "admin@example.com"
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
