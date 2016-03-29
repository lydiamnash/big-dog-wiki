class User < ActiveRecord::Base
  has_many :articles, foreign_key: :creator_id
  has_many :versions, foreign_key: :editor_id

  has_secure_password
end
