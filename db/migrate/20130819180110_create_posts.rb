class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :sharer_name
      t.string :sharer_facebook_id
      t.text :message
      t.string :link
      t.string :created_time
      t.string :post_facebook_id
      t.integer :user_id

      t.timestamps
    end
  end
end
