class Comic < ActiveRecord::Base
  has_many :pages
  has_many :comic_assets
  validates_presence_of :name, :shortname
end
