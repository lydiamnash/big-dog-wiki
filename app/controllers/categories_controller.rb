class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @q = Version.ransack(params[:q])
    @articles = @q.result(distinct: true)
    @featured_articles = Article.five_most_recent
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create

  end



end
