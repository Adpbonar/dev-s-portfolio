class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    def index
      @articles = Article.all.order([:id]).reverse_order
    end
  
    def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      if @article.article_posted == true
        flash[:notice] = "Article was successfully published"
        redirect_to root_path
      elsif @article.article_posted == false
        flash[:notice] = "Article was successfully created and will be published at the scheduled time"
        redirect_to root_path
      elsif @article.article_post_scheduled == true
        flash[:notice] = "Article was successfully scheduled"
        redirect_to root_path
      elsif @article.article_post_scheduled == false
        flash[:notice] = "Article was successfully saved as a draft"
        redirect_to root_path
      else
        flash[:success] = "Article was not created"
        render 'edit'
      end
    end
  end
  
  def show
    @article.article_posted
  end

  def update
    if @article.update(article_params)
      if @article.article_posted == true
        flash[:notice] = "Article was successfully published"
        redirect_to root_path
      elsif @article.article_posted == false
        flash[:notice] = "Article was successfully created as a draft"
        redirect_to root_path
      elsif @article.article_post_scheduled == true
        flash[:notice] = "Article was successfully scheduled"
        redirect_to root_path
      elsif @article.article_post_scheduled == false
        flash[:notice] = "Article was successfully saved as a draft"
        redirect_to root_path
      else
        flash[:success] = "Article was not updated"
        render 'edit'
      end
    end
  end


  def destroy
    if @article.user != current_user
      return render plain: "Not Allowed", status: :forbidden
    end
    flash[:success] = "Article was deleted"
    @article.destroy
    redirect_to root_path
  end
  
  private 

  def article_params
    params.require(:article).permit(:title, :snippet, :post, :published, :scheduled_for, :featured, :draft)
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end

end
