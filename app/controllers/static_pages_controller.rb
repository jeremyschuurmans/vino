class StaticPagesController < ApplicationController
  layout "alternate"

  def home
    if logged_in?
      @user = current_user
      redirect_to user_path(@user)
    else
      render 'home'
    end
  end
end
