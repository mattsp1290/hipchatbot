class HipChatEventHelper
  def self.process_event(event)
  	event_handlers = [MentionHandler, ReplyHandler]
  	handled = false
  	event_handlers.each do |handler|
  		handled = handler.process(event) unless handled
  	end
  end
end