class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :versions, through: :categorizations

end
