json.array!(@reddits) do |reddit|
  json.extract! reddit, :id, :room, :subreddit
  json.url reddit_url(reddit, format: :json)
end
