class Post < ActiveRecord::Base
	include Chattable

	def self.test
		send('Test', 'Hello!')
	end
end
