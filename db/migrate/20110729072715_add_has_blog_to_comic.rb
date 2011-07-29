class AddHasBlogToComic < ActiveRecord::Migration
  def self.up
    add_column :comics, :has_blog, :string
  end

  def self.down
    remove_column :comics, :has_blog
  end
end
