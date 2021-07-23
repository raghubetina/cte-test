class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :comments_count
      t.integer :tags_count

      t.timestamps
    end
  end
end
