class Article < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  has_many :versions

  def latest_version
    self.versions.order("updated_at desc").where(published: true).first
  end

end
