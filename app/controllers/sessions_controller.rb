class SessionsController < ApplicationController
  layout "alternate"

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = "Email or password not valid"
      render 'new'
    end
  end

  def destroy
  end
end
