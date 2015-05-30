class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new # so @article will not be nil in the view when checking for errors
  end

  def create
    @article = Article.new(article_params)
    if @article.save #returns a boolean
      redirect_to @article
    else
      render 'new' #use render instead of redirect_to so the @articble object passed to new template
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
