# This migration comes from blog (originally 20230605140627)
class CreateBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
