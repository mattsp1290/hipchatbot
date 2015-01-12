class CreateRedditPosts < ActiveRecord::Migration
  def change
    create_table :reddit_posts do |t|
      t.string :subreddit
      t.string :text
      t.string :url

      t.timestamps
    end
  end
end
