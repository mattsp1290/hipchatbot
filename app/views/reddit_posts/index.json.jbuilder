json.array!(@reddit_posts) do |reddit_post|
  json.extract! reddit_post, :id, :subreddit, :text, :url
  json.url reddit_post_url(reddit_post, format: :json)
end
