class CommentsController < ApplicationController
  before_action :find_commentable_wine

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.commentable_id = @commentable_wine.id
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to wine_path(@wine)
    else
      flash[:danger] = "Comment not posted"
      redirect_to wine_path(@wine)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def find_commentable_wine
      @commentable_wine = Wine.find_by_id(params[:wine_id]) if params[:wine_id]
      @wine = @commentable_wine
    end

end
