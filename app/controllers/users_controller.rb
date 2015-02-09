class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You successfully registered!'
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(slug: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirm)
  end
end