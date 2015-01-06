class Janitor < Worker
  def self.work
  	records_cleaned = 0
  	models = [RedditPost, HipChatEvent]
  	models.each do |model|
  		clean(model)
  	end
  end

  def self.clean(model)
  	items = model.where("created_at <= ?", DateTime.now - 1)
  	items.each do |item|
  		Rails.logger.info 'Deleting: #{item}'
  		item.delete
  	end
  end
end