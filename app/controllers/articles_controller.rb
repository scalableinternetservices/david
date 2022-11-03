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


# frozen_string_literal: true

# class SubmissionsController < ApplicationController
#   before_action :set_submission, only: %i[destroy show]

#   def destroy
#     @submission.destroy
#     redirect_to root_path, notice: 'Submission was successfully destroyed.'
#   end

#   def index
#     @submissions = Submission.all.reverse_order
#   end

#   def new
#     @submission = Submission.new(community_id: params['community_id'])
#   end

#   def show; end

#   private

#   def set_submission
#     @submission = Submission.find(params[:id])
#   end

#   def submission_params
#     params.require(:submission).permit(:title, :url, :community_id)
#   end
# end
