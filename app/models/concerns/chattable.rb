module Chattable
  extend ActiveSupport::Concern
  module ClassMethods
    def send(room, message)
      hipchat = create_client
      hipchat[room].send(ENV['bot_name'], 'Yay!', :message_format => 'text', :notify => true)
    end

    def create_client
      hipchat_key = Rails.application.secrets.hipchat_key
      HipChat::Client.new(ENV['hipchat_key'], :api_version => 'v2')
    end
  end
  
end