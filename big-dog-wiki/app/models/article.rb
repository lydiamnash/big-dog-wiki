class Article < ActiveRecord::Base
  belongs_to :editor, class_name: "User"
  
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :images
  has_many :sources
end
