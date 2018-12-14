class SessionsController < ApplicationController
  def new
    render :layout => 'alternate'
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])

    else
      flash[:danger] = "Email or password not valid"
      render 'new', :layout => 'alternate'
    end
  end

  def destroy
  end
end
