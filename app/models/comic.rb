class Comic < ActiveRecord::Base
  has_many :pages
  has_many :comic_assets
  accepts_nested_attributes_for :pages, :comic_assets
  validates_presence_of :name, :shortname
  validates_uniqueness_of :name, :shortname
end
