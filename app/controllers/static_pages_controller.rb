class StaticPagesController < ApplicationController

  def index
    @articles = Article.all.order([:id]).reverse_order
    @projects = Project.all.order([:id]).reverse_order
    @code_samples = CodeSample.all.order([:id]).reverse_order
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
