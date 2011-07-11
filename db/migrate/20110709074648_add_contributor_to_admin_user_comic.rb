class AddContributorToAdminUserComic < ActiveRecord::Migration
  def self.up
    add_column :admin_user_comics, :contributor_id, :integer
    remove_column :admin_user_comics, :admin_user_id
  end

  def self.down
    remove_column :admin_user_comics, :contributor_id
    add_column :admin_user_comics, :admin_user_id, :integer
  end
end
