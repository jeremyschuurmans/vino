class WinesController < ApplicationController
  before_action :log_in_check, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :correct_user_check, only: [:edit, :update, :destroy]
  after_action :save_user_url, only: [:new]

  def new
    @wine = Wine.new
    render :layout => 'alternate'
  end

  def create
    @user = current_user
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      flash[:success] = "Success!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @wine = Wine.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @wine = Wine.find(params[:id])
    render :layout => 'alternate'
  end

  def update
    @user = current_user
    @wine = Wine.find(params[:id])
    if @wine.update_attributes(wine_params)
      flash[:success] = "Wine successfully updated!"
      redirect_to @user
    else
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @user = current_user
    @wine.destroy
    flash[:success] = "Wine deleted"
    redirect_back(fallback_location: root_url)
  end

  private

    def wine_params
      params.require(:wine).permit(:name, :winery, :vintage, :origin, :price, :rating, :tasting_notes, :picture)
    end

    def log_in_check
      unless logged_in?
        set_forwarding_url #helper method located in sessions_helper.rb
        flash[:danger] = "Please log in to continue."
        redirect_to login_url
      end
    end

    def correct_user_check
      @wine = current_user.wines.find_by(id: params[:id])
      redirect_back(fallback_location: root_url) if @wine.nil?
    end
end
