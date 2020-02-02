class CommentsController < ApplicationController

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy 
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if user_signed_in?
      @comment.destroy
      redirect_to article_path(@article)
      flash[:notice] = 'Comment was successfully deleted.'
    else
      redirect_to article_path(@article)
      flash[:alert] = 'You need to be logged in to complete this action.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
