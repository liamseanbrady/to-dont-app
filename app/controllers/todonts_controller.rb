class TodontsController < ApplicationController
  def index
    @todonts = current_user.todonts
    @todont = Todont.new
  end

  def create
    @todont = Todont.new(todont_params)
    @todont.creator = current_user

    if @todont.save
      flash[:notice] = "Your todon't was created successfully!"
      redirect_to user_todonts_path(current_user)
    else
      render :index
    end
  end

  def show
    @todont = Todont.find_by(slug: params[:id])
  end

  private

  def todont_params
    params.require(:todont).permit(:body)
  end
end