class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
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
        flash[:notice] = "Article was successfully scheduled"
        redirect_to article_path(@article)
      else
        flash[:notice] = "Article was successfully published"
        redirect_to article_path(@article)
      end
    else
     render 'new'
    end
  end
  
  def show
  end

  def update
    if @article.update(article_params)
      if @article.draft == true
        @article.update(published: false)
      else
        @article.update(published: true)
      end
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
     flash[:success] = "Article was not updated"
     render 'edit'
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
    redirect_to articles_path
  end
  
  private 

  def article_params
    params.require(:article).permit(:title, :snippet, :post, :published, :scheduled_for, :featured, :draft)
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end
end
