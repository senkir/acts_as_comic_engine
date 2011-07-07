class CreateAdminUserComics < ActiveRecord::Migration
  def self.up
    create_table :admin_user_comics, :id => false do |t|
      t.integer :comic_id
      t.integer :admin_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_user_comics
  end
end
