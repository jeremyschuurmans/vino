class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def log_in_check
    unless logged_in?
      set_forwarding_url
      flash[:danger] = "Please log in to continue."
      redirect_to login_url
    end
  end
end
