class CommentsController < ApplicationController

  def new
   if current_user
      # Need to populate form with the information
      @article = Article.find(params[:article_id])
      @comment = Comment.new
    else
      # Fix this
      @error = "ASDFDFRRDFASDFASDFASDFASDF"
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article)
    else
      # Add logic to account validations
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
