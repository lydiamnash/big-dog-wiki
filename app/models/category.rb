class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :versions, through: :categorizations

  validates :name, {presence: true}

  def self.current_articles(id)
    category_articles = []

    Article.all_current_versions.each do |version|
      version.categories.each do |category|
        if category == @category
          category_articles << version
        end
      end
    end

    category_articles
  end
end
