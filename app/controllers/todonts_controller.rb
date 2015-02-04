class TodontsController < ApplicationController
  def index
    @todonts = current_user.todonts
  end
end