class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => 'alternate'
  end

  def show
    @user = User.find(params[:id])
  end
end
