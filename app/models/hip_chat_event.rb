class HipChatEvent < ActiveRecord::Base
	after_save :process

	def process
		HipChatEventHelper.process_event(self)
	end
end
