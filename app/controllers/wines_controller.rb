class WinesController < ApplicationController
  before_action :log_in_check, only: [:create, :destroy]

  def new
    @wine = Wine.new
    render :layout => 'alternate'
  end

  def create
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      flash[:success] = "That sounds delicious!"
      redirect_to root_url
    else
      render 'new'
    end
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
      render 'edit'
    end
  end

  def destroy
  end

  private

    def wine_params
      params.require(:wine).permit(:name, :winery, :vintage, :origin, :price,
                                                     :rating, :tasting_notes)
    end
end
