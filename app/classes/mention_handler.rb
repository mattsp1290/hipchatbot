class MentionHandler
  def self.process(event)
  	if event.message.include? "@#{ENV['bot_name']}"
  		Rails.logger.error '----------------------'
  		Rails.logger.error 'I have been mentioned!'
  		if event.message.downcase.include? "weather"
  			Rails.logger.error 'I am going to tell John the weather!'
  		end
  		return true
  	end
  	return false
  end
end