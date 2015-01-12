class Post < ActiveRecord::Base
	include Chattable

	def self.test
		Post.send_message('Test', 'Hello!')
	end
end
