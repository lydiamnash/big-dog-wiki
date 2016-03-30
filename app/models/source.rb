class Source < ActiveRecord::Base
  belongs_to :version

  validates :url, :version, {presence: true}
end
