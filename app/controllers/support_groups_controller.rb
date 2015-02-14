class SupportGroupsController < ApplicationController
  before_action :require_user

  def index
    @support_groups = SupportGroup.all 
  end
  
  def new
    @support_group = SupportGroup.new 
  end

  def create
    @support_group = SupportGroup.new(support_group_params)
    @support_group.moderator = current_user

    if @support_group.save
      flash[:notice] = "You created a new support group"
      redirect_to user_support_groups_path(current_user)
    else
      flash[:error] = "The support group could not be created"
      render :new
    end
  end

  private

  def support_group_params
    params.require(:support_group).permit(:name)
  end
end
