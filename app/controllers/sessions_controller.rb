class SessionsController < ApplicationController
  layout "alternate"

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_by(email: auth['info']['email'])
      if @user
        log_in @user
        redirect_to feed_user_path(@user)
      else
        secure_password = SecureRandom.urlsafe_base64
        @user = User.create(name: auth['info']['name'], email: auth['info']['email'], password: secure_password, password_confirmation: secure_password)
        log_in @user
        redirect_to feed_user_path(@user)
      end
    else
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or feed_user_path(@user)
      else
        flash.now[:danger] = "Email or password not valid"
        render 'new'
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end
