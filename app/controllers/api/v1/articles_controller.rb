module Api
  module V1
    class ArticlesController < ApplicationController
      respond_to :json

      def index
        @articles = Article.all
        respond_with @articles
      end

      def create
        @article = Article.new article_params
        @article.save
        respond_with @article, location: false
      end

      def show
        @article = Article.find(params[:id])
        respond_with @article
      end

      def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        respond_with @article, location: false

      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
        respond_with @article
      end

      private

      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
