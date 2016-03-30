module ArticlesHelper
  def featured_article
    Version.order(updated_at: :desc).first
  end
end
