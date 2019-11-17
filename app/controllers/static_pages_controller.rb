class StaticPagesController < ApplicationController

  def index
    @articles = Article.all
    @projects = Project.all
    @code_samples = CodeSample.all
  end
  def about
  end

  def contact_me
  end
  
end
