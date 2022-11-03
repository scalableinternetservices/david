class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_url, notice: 'article was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def index
    @articles = Article.all
    @article = Article.new
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :url)
  end
end
