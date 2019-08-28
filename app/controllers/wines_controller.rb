class WinesController < ApplicationController
<<<<<<< HEAD

  get '/wines' do
    if logged_in?
      @user = current_user
      @wines = Wine.all
      erb :'wines/wines'
    else
      redirect '/'
    end
  end

  get '/wines/new' do
    if logged_in?
      @user = current_user
      erb :'wines/new'
    else
      redirect '/'
    end
  end

  post '/wines' do
    if  !params[:name].empty?    &&
        !params[:winery].empty?  &&
        !params[:vintage].empty? &&
        !params[:origin].empty?  &&
        !params[:price].empty?   &&
        !params[:rating].empty?  &&
        !params[:tasting_notes].empty?
        @wine = Wine.new( name: params[:name],
                          winery: params[:winery],
                          vintage: params[:vintage],
                          origin: params[:origin],
                          price: params[:price],
                          rating: params[:rating],
                          tasting_notes: params[:tasting_notes],
                          other_notes: params[:other_notes])
        @wine.user = current_user
       if @wine.save
         redirect "/wines"
       end
    else
     redirect '/wines/new'
    end
  end

  get '/wines/:id/edit' do
    if logged_in?
      @user = current_user
      @wine = Wine.find_by(id: params[:id])
      if @wine.user_id == current_user.id
        erb :'wines/edit'
      else
        redirect '/wines'
      end
    else
      redirect '/'
    end
  end

  patch '/wines/:id' do
    if logged_in?
      @user = current_user
      @wine = Wine.find(params[:id])
      if  !params[:name].empty? &&
          !params[:winery].empty? &&
          !params[:vintage].empty? &&
          !params[:origin].empty? &&
          !params[:price].empty? &&
          !params[:rating].empty? &&
          !params[:tasting_notes].empty? &&
          @wine.user_id == current_user.id
          @wine.update(name: params[:name],
                       winery: params[:winery],
                       vintage: params[:vintage],
                       origin: params[:origin],
                       price: params[:price],
                       rating: params[:rating],
                       tasting_notes: params[:tasting_notes],
                       other_notes: params[:other_notes])
          redirect "/wines"
      else
        redirect "/wines/#{@wine.id}/edit"
      end
    else
      redirect '/'
    end
  end

  delete '/wines/:id' do
    if logged_in?
      @user = current_user
      @wine = Wine.find(params[:id])
      if @wine.user_id == current_user.id
         @wine = Wine.delete(params[:id])
         redirect '/wines'
      else
        redirect '/wines'
      end
    else
      redirect back
    end
  end
=======
  before_action :log_in_check, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :correct_user_check, only: [:edit, :update, :destroy]

  def new
    @wine = Wine.new
    render :layout => 'alternate'
  end

  def create
    @user = current_user
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      @user.wines << @wine
      flash[:success] = "Success!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @wine = Wine.find(params[:id])
    @user = User.find(@wine.user_id)
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
    @wine = Wine.find(params[:id])
    if @wine.destroy
      flash[:success] = "Wine deleted"
      redirect_to @user
    else
      redirect_back(fallback_location: root_url)
    end
  end

  private

    def wine_params
      params.require(:wine).permit(:name, :winery, :vintage, :origin, :price, :rating, :tasting_notes, :user_id)
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
>>>>>>> 838f433e9496433f5afd2ec9171af631f6972d9a
end
