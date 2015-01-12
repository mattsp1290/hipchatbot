require 'HipChat'

class HipChatHelper
	def self.get_client
		return HipChat::Client.new(ENV['hipchat_key'], :api_version => 'v2')
	end

	def self.send_message(room, message)
		hipchat = get_client
    	begin
    		hipchat[room].send(ENV['bot_name'], message, :message_format => 'text', :notify => true)
    	rescue HipChat::UnknownRoom
    		Rails.logger.error 'Room #{room} is unkown'
    	rescue => e
    		Rails.logger.error e
    		raise e
    	end
	end

	def self.get_room_id(room)
		hipchat = get_client
		room = hipchat[room].get_room
		room['id']
	end
end