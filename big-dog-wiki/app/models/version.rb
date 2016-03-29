class Version < ActiveRecord::Base
  belongs_to :article
  belongs_to :editor, class_name: "User", foreign_key: :editor_id

  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :sources
end
