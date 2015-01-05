class HipChatEventHelper
  def self.process_event(event)
  	handled = false
  	handled = MentionHandler.process(event) unless handled
  	handled = ReplyHandler.process(event) unless handled
  end
end