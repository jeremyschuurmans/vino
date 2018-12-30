class UsersController < ApplicationController
  before_action :log_in_check, only: [:index, :show, :edit, :update, :destroy, :feed, :following, :followers]
  before_action :correct_user_check, only: [:edit, :update, :feed]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    @user = current_user
    render :layout => 'alternate'
  end

  def new
    @user = User.new
    render :layout => 'alternate'
  end

  def show
    @user = User.find(params[:id])
    @wines = @user.wines.paginate(page: params[:page])
    @comments = Comment.all
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

  def feed
    @user = current_user
    @feed_items = @user.feed.paginate(page: params[:page])
    @comments = Comment.all
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end

    def log_in_check
      unless logged_in?
        set_forwarding_url #helper method located in sessions_helper.rb
        flash[:danger] = "Please log in to continue."
        redirect_to login_url
      end
    end

    def correct_user_check
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
