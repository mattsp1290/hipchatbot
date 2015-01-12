class ReplyHandler
  def self.process(event)
    replies = Reply.all
    handled = false
    replies.each do |reply|
    	if ((event.room == reply.room.to_i) || (reply.room == '') || (reply.room.nil?)) && (not handled)
    		if (reply.mention_name == '' || reply.mention_name.nil?) || (reply.mention_name == event.mention_name)
    			handled = process_reply(event, reply)
    		end
    	end
    end
    return handled
  end

  def self.process_reply(event, reply)
  	reply.keywords.each do |keyword|
    	if event.message.downcase.include? keyword.downcase
    		gif = ReplyGifHelper.gif(reply.tags)
    		HipChatHelper.send_message(event.room, gif) unless (gif == '') || gif.nil?
    		return true
    	end
    end
    return false
  end
end