class User < ActiveRecord::Base
  has_many :articles, foreign_key: :editor_id

  has_secure_password
end
