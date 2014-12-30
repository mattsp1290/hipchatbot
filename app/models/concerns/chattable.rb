module Chattable
  extend ActiveSupport::Concern
  module ClassMethods
    def send_message(room, message)
      hipchat = create_client
      begin
        hipchat[room].send(ENV['bot_name'], 'Yay!', :message_format => 'text', :notify => true)
      rescue HipChat::UnknownRoom
        puts 'Room: ' + room
      end
    end

    def create_client
      hipchat_key = Rails.application.secrets.hipchat_key
      HipChat::Client.new(ENV['hipchat_key'], :api_version => 'v2')
    end
  end
  
end