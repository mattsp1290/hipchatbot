class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
      t.string :room
      t.string :subreddit

      t.timestamps
    end
  end
end
