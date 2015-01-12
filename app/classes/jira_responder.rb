require 'HTTParty'

class JiraResponder
	def self.respond(event)
		if event.message.downcase.include? 'jira'
			summary = event.message.gsub(/(jira)/i, '').gsub(/(@#{Regexp.quote(ENV['bot_name'])})/i, '').strip!
			auth = {username: ENV['jira_username'], password: ENV['jira_password']}
			headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
			data = {fields: {project: {key: ENV['jira_project']}, summary: summary, description: summary, issuetype: {id: 1}}}
			issue = HTTParty.post("#{ENV['jira_url']}/rest/api/2/issue", headers: headers, body: data.to_json, basic_auth: auth)
			Rails.logger.debug '----------------------'
  		Rails.logger.debug issue
			HipChatHelper.send_message(event.room, "Issue has been created. You can view this issue at #{ENV['jira_url']}/browse/#{issue.parsed_response['key']}")
		end
	end
end