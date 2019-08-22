class RelationshipsController < ApplicationController
  before_action :log_in_check

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end

  private

    def log_in_check
      unless logged_in?
        set_forwarding_url #helper method located in sessions_helper.rb
        flash[:danger] = "Please log in to continue."
        redirect_to login_url
      end
    end

end
