module ArticlesHelper
  def featured_article
    Article.order(updated_at: :desc).first
  end
end
