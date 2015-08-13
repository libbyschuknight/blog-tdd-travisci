class CommentsController < ApplicationController

  def index
    article = Article.find(params[:article_id])
    render json: article.comments
  end

  def create
    Comment.create(article_id: params[:article_id], content: params[:comment][:content])

    redirect_to article_path(params[:article_id])
  end

  def show
    # @comment = Comment.find_by
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    article_id = comment.article_id

    redirect_to article_path(params[:article_id])
  end


end
