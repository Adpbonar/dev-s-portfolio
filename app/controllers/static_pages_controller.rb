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

  def more_code
  end

  def more_projects
  end

end
