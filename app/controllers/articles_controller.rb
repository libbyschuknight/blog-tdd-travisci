class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by_id(params[:id])
    unless @article
      flash[:error] = "Article not found"
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      # add error? before redirecting? or display on page redirected to??
      redirect_to(new_article_path)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
