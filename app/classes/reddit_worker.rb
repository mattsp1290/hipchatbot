class RedditWorker < Worker
  def self.work
  	reddits = Reddit.all
  	posts = RedditPost.all
  	client = Snooby::Client.new("#{ENV['reddit_name']}, 1.0")
  	reddits.each do |reddit|
  		subreddit_posts = client.r(reddit.subreddit).posts
		subreddit_posts.each do |subreddit_post|
			post_date = parse_reddit_date(subreddit_post['created_utc'])
			if (post_date > DateTime.now - 1)
				url = subreddit_post.url ? subreddit_post.url : ('http://www.reddit.com' + subreddit_post.permalink)
				text = subreddit_post.title
				repeat = false
				posts.each do |post|
					if (post.text == text) && (post.url == url) && (post.subreddit == reddit.subreddit)
						repeat = true
					end
				end
				unless repeat
					post = RedditPost.new
					post.text = text
					post.url = url
					post.subreddit = reddit.subreddit
					post.save
					HipChatHelper.send_message(reddit.room, "#{post.text} #{post.url}")
				end
			end
		end
  	end
  end

  def self.parse_reddit_date(date)
	DateTime.parse(Time.at(date).to_s)
  end
end