class GroupsController < ApplicationController
  def index
    #Displaying groups; may be unnecessary if we are sticking just one group
    @groups = Group.all
  end

  def show
  	#will show the page for our friend group
  	@group = Group.find(params[:id])
  	#@users = @group.users
  	#Rails.logger.debug("Group id: #{@group.id}")
  	#unless @group.id == current_user.group_id
  	#	redirect_to :back, :alert => "Access denied."
  	#end
  end
end
