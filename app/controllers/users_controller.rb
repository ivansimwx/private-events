class UsersController < ApplicationController
  def show
    @events = @user.events # Fetch events created by the user
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
