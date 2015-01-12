json.array!(@replies) do |reply|
  json.extract! reply, :id, :room, :mention_name, :keywords, :tags
  json.url reply_url(reply, format: :json)
end
