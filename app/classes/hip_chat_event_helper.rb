class HipChatEventHelper
  def self.process_event(event)
  	handled = false
  	handled = ReplyHandler.process(event) unless handled
  end
end