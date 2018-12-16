class UsersController < ApplicationController
  before_action :log_in_check, only: [:index, :edit, :update]
  before_action :correct_user_check, only: [:edit, :update]

  def index
    @users = User.all
  end

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
      log_in @user
      flash[:success] = "Welcome to Vino!"
      redirect_to @user
    else
      render 'new', :layout => 'alternate'
    end
  end

  def edit
    @user = User.find(params[:id])
    render :layout => 'alternate'
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Saved Successfully!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def log_in_check
      unless logged_in?
        set_forwarding_url
        flash[:danger] = "Please log in to continue."
        redirect_to login_url
      end
    end

    def correct_user_check
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end
