module Chattable
  extend ActiveSupport::Concern

  def send(room, message)
  	hipchat = create_client
  	bot_name = Rails.configuration.bot_name
  	hipchat[room].send('HipchatBot', 'Yay!', :message_format => 'text', :notify => true)
  end

  def create_client
		hipchat_key = Rails.application.secrets.hipchat_key
		HipChat::Client.new(hipchat_key, :api_version => 'v2')
	end
end