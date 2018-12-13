class UsersController < ApplicationController
  def new
    render :layout => 'alternate'
  end

  def show
    @user = User.find(params[:id])
  end
end
