class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(slug: params[:id])
  end
end