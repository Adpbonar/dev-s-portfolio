class StaticPagesController < ApplicationController

  def index
    @articles = Article.all
  end
  def about
  end

  def resume
  end
end
