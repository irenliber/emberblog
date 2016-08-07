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

      end

      def update

      end

      def destroy

      end

      private

      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
