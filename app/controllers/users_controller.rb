class UsersController < ApplicationController
  before_action :log_in_check, only: [:index, :edit, :update, :destroy]
  before_action :correct_user_check, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
    render :layout => 'alternate'
  end

  def show
    @user = User.find(params[:id])
    @wines = @user.wines.paginate(page: params[:page])
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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User has been removed"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user_check
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
