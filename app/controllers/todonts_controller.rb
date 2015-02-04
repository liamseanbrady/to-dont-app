class TodontsController < ApplicationController
  def index
    @todonts = current_user.todonts
  end

  def show
    @todont = Todont.find(params[:id])
  end
end