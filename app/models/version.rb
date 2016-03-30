class Version < ActiveRecord::Base
  belongs_to :article
  belongs_to :editor, class_name: "User", foreign_key: :editor_id

  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :sources

  validates :title, :content, :article, :editor, {presence: true}

  def all_sources=(new_sources)
    new_sources.split(' ').each do |source|
      sources.new(url: source)
    end
  end
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end

end
