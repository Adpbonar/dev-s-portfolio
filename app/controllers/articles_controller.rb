class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :article_publish
  before_action :drafts
  
    def index
      @articles = Article.all
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
      end
    end
  end
  
  def show
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
      else
        flash[:success] = "Article was not updated"
        render 'edit'
      end
    end
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end
  def index
    @articles = Article.all
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

  def article_publish
    if @article.present?
      if @article.draft == false 
        if @article.scheduled_for >= DateTime.current
          @article.update(published: true)
          @article.reload
        end
      end
    end
  end

  def drafts
    if @article.present?
      if @article.draft == true
        @article.update(published: false)
        @article.reload
      end
    end
  end
end
