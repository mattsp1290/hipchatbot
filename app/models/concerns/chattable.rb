module Chattable
  extend ActiveSupport::Concern
  module ClassMethods
    def send_message(room, message)
      return HipChatHelper.send_message(room, message)
    end

    def create_client
      return HipChatHelper.get_client
    end
  end
  
end