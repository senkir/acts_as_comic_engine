class CreateAdminUsersComics < ActiveRecord::Migration
  def self.up
    create_table :admin_users_comics do |t|
      t.string :comic_id
      t.string :admin_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_users_comics
  end
end
