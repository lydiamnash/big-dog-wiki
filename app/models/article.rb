class Article < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  has_many :versions
  has_many :comments

  validates :creator, {presence: true}

  def latest_version
    self.versions.order("updated_at desc").where(published: true).first
  end

  def self.all_current_versions
    current_versions = []
    Article.all.each do |article|
      if article.latest_version
        current_versions << article.latest_version
      end
    end
    current_versions
  end

  def self.five_most_recent
    Article.all_current_versions.sort_by(updated_at:)
  end

end
