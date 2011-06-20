class Comic < ActiveRecord::Base
  has_many :pages, :foreign_key => :comic_oid
  
  validates_uniqueness_of :oid
  validates_presence_of :oid, :name
  validates_size_of :oid, :exactly => 14
  
end
