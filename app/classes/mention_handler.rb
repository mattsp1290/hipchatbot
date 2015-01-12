class MentionHandler
  def self.process(event)
  	if event.message.include? "@#{ENV['bot_name']}"
  		Rails.logger.debug '----------------------'
  		Rails.logger.debug 'I have been mentioned!'
  		responders = [WeatherResponder, MigrationResponder, JiraResponder]
  		responders.each {|responder| return true if responder.respond(event)}
  	end
  	return false
  end
end