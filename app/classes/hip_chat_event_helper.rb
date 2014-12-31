class HipChatEventHelper
  def self.process_event(event)
  	Rails.logger.info 'Process Event'
    Rails.logger.info event
    Rails.logger.info '------------'
  end
end