json.array!(@hooks) do |hook|
  json.extract! hook, :id, :room, :url, :event
  json.url hook_url(hook, format: :json)
end
