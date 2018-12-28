class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "Comment not posted"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Wine.find_by_id(params[:wine_id]) if params[:wine_id]
    end

end
