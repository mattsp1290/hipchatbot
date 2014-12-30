class HookValidator < ActiveModel::Validator
	require'HTTParty'
	def validate(hook)
		hook_response = HTTParty.post("http://api.hipchat.com/v2/room/#{hook.room}/webhook?auth_token=#{ENV['hipchat_key']}", :body => {'url'=>hook.url, 'event' => hook.event}.to_json, :headers => {'Content-Type' => 'application/json'})
		Rails.logger.info 'Hook URL'
		Rails.logger.info "http://api.hipchat.com/v2/room/#{hook.room}/webhook?auth_token=#{ENV['hipchat_key']}"
		Rails.logger.info '------------'
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
	validates :room, :url, :event, :presence => true
	validates_with HookValidator
end