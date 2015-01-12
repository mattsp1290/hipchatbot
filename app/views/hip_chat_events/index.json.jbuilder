json.array!(@hip_chat_events) do |hip_chat_event|
  json.extract! hip_chat_event, :id, :webhook_type, :date, :mention_name, :message, :room, :webhook_id
  json.url hip_chat_event_url(hip_chat_event, format: :json)
end
