class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "<b>#{user.name}</b> <br> #{user.status.description}"
    end
  end

  def show
    @user = User.find(params[:id])
    @status = @user.status
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  #experiment
  #testing
  def update
    @user = User.find(params[:id])
    @status = @user.status
    if (params[:status] != nil)
      if @status.update_attributes(params[:status].permit(:description))
        redirect_to '/users/'
      end
    else
      if @user.update_attributes(params[:user].permit(:address))
        redirect_to '/users/'
      end
    end
    
  end


  def create
    @user = User.create(user_params)
  end
  private
    def user_params
      params.require(:user).permit(:photo)
    end

end
