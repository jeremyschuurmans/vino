class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment
      redirect_to :back, flash.now[:success] = "Comment posted!"
    else
      redirect_to :back, flash.now[:danger] = "Comment not posted"
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
