class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @articles = Article.all
    end
  
    def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    created = @article.created_at
    @article.scheduled_for = created
    if @article.save
      if @article != @article.published
        redirect_to edit_article_path(@article)
      else
        flash[:notice] = "Article was successfully created"
        redirect_to article_path(@article)
      end
    else
     render 'new'
    end
  end
  
  def show
    @article = Article.friendly.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:id])
    if @article.update(article_params)
     flash[:success] = "Article was updated"
     redirect_to article_path(@article)
     @article.schedule_to_publish
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
    @article = Article.friendly.find(params[:id])
    if @article.user != current_user
      return render plain: "Not Allowed", status: :forbidden
    end
    flash[:success] = "Article was deleted"
    @article.destroy
    redirect_to articles_path
  end
  
  private 

  def article_params
    params.require(:article).permit(:title, :snippet, :post, :published, :scheduled_for)
  end

  def schedule_to_publish
    @article = Article.friendly.find(params[:id])
    @publish = @article.published
    if Time.now.to_s >= @article.scheduled_for
      return !@article.publish
    end
  end
end
