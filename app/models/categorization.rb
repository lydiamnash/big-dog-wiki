class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :version

  validates :category, :version, {presence: true}
end
