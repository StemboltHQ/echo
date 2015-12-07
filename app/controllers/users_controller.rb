class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created"
    else
      render :new
    end
  end

  def edit
    @user = User.find current_user
  end

  def update
    @user = User.find current_user
    if @user.update user_params
      redirect_to @user, notice: "Account updated"
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end