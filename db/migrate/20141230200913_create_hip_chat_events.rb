class CreateHipChatEvents < ActiveRecord::Migration
  def change
    create_table :hip_chat_events do |t|
      t.string :type
      t.date :date
      t.string :mention_name
      t.string :message
      t.integer :room
      t.integer :webhook_id

      t.timestamps
    end
  end
end
