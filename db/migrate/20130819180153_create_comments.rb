class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter_name
      t.string :commenter_facebook_id
      t.string :message
      t.string :created_time
      t.string :comment_facebook_id
      t.integer :post_id

      t.timestamps
    end
  end
end
