class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => 'alternate'
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Vino!"
      redirect_to @user
    else
      render 'new', :layout => 'alternate'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
