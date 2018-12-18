class WinesController < ApplicationController

  def new
    @wine = Wine.new
    render :layout => 'alternate'
  end

  def create
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
end
