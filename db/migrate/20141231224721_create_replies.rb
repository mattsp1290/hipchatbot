class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :room
      t.string :mention_name
      t.text :keywords
      t.text :tags

      t.timestamps
    end
  end
end
