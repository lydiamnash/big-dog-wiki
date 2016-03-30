class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category_query = Category.ransack(params[:q])
    @search = Article.ransack(params[:q])
    @articles = @search.result(distinct: true)
    @featured_articles = Article.five_most_recent
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = []

    Article.all_current_versions.each do |version|
      version.categories.each do |category|
        if category == @category
          @category_articles << version
        end
      end
    end

    @category_articles
  end

  def create

  end

end
