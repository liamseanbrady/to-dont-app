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
    @progress_log = ProgressLog.new
    @progress_logs = @todont.progress_logs
  end

  def progress_log
    @progress_log = ProgressLog.new(progress_log_params)
    @progress_log.todont = Todont.find_by(slug: params[:id])

    if @progress_log.save
      flash[:notice] = 'Your progress log was saved successfully.'
      redirect_to user_todont_path(current_user, @progress_log.todont)
    else
      render :show
    end
  end

  private

  def todont_params
    params.require(:todont).permit(:body, :visibility)
  end

  def progress_log_params
    params.require(:progress_log).permit(:message, :mood)
  end
end