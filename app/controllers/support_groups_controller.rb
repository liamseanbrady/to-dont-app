class SupportGroupsController < ApplicationController
  def index
   @support_groups = SupportGroup.all 
  end
end
