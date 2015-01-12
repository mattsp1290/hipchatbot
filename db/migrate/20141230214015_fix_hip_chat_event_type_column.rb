class FixHipChatEventTypeColumn < ActiveRecord::Migration
  def change
    rename_column :hip_chat_events, :type, :webhook_type
  end
end
