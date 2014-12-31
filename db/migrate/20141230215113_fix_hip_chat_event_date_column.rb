class FixHipChatEventDateColumn < ActiveRecord::Migration
  def change
    change_column :hip_chat_events, :date, :datetime
  end
end
