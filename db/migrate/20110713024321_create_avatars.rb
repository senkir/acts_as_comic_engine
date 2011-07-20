class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
      t.string :image
      t.integer :admin_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :avatars
  end
end
