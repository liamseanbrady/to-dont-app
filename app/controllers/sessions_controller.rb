class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      flash[:notice] = 'You logged in successfully'
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now[:error] = "There's something wrong with your username or password"
      render :new
    end
  end

  def logout
    flash[:notice] = 'You logged out'
    session[:user_id] = nil
    redirect_to users_path
  end
end