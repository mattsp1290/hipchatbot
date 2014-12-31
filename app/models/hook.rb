class HookValidator < ActiveModel::Validator
	require'HTTParty'
	def validate(hook)
		if hook.url.nil? or hook.url == ''
			hook.url = ENV['base_url'] + '/events/receive'
		end
		if hook.event.nil? or hook.event == ''
			hook.event = 'room_message'
		end
		hook_response = HTTParty.post("http://api.hipchat.com/v2/room/#{hook.room}/webhook?auth_token=#{ENV['hipchat_key']}", :body => {'url'=>hook.url, 'event' => hook.event}.to_json, :headers => {'Content-Type' => 'application/json'})
		begin
			hook_response = hook_response.parsed_response
		end
		if hook_response.has_key?("error")
			hook.errors[:base] << "Unable to create webook due to: #{hook_response['error']['message']}"
		end
	end
end

class Hook < ActiveRecord::Base
	include ActiveModel::Validations
	validates :room, :presence => true
	validates_with HookValidator
end