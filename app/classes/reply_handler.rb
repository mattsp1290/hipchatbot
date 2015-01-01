class ReplyHandler
  def self.process(event)
  	Rails.logger.info 'Reply handler hit'
    Rails.logger.info '------------'
    replies = Reply.all
    handled = false
    replies.each do |reply|
    	if (event.room == reply.room.to_i) && (not handled)
    		Rails.logger.info 'Room is valid'
    		Rails.logger.info '------------'
    		if (reply.mention_name == '' || reply.mention_name.nil?) || (reply.mention_name == event.mention_name)
    			Rails.logger.info 'Mention Name is valid'
    			Rails.logger.info '------------'
    			handled = process_reply(event, reply)
    		end
    	end
    end
    return handled
  end

  def self.process_reply(event, reply)
  	Rails.logger.info 'Process reply'
    Rails.logger.info reply
    Rails.logger.info '------------'
  	reply.keywords.each do |keyword|
    	if event.message.downcase.include? keyword.downcase
    		gif = ReplyGifHelper.gif(reply.tags)
    		Rails.logger.info 'Gif reply'
		    Rails.logger.info gif
		    Rails.logger.info '------------'
    		HipChatHelper.send_message(event.room, gif) unless (gif == '') || gif.nil?
    		return true
    	end
    end
    return false
  end
end