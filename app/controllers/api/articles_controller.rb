module Api
  class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      render json: Article.all
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        render json: @article
      else
        render :json => { :errors => @article.errors.full_messages }, :status => 422
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :url)
    end
  end
end
