class StaticPagesController < ApplicationController

  def index
    @articles = Article.all
    @projects = Project.all
    @code_samples = CodeSample.all
    @index_document = IndexDocument.find(1)
    @about_document = AboutDocument.find(1)
  end
  def about
    @about_document = AboutDocument.find(1)
  end

  def contact_me
    @about_document = AboutDocument.find(1)
  end

end
