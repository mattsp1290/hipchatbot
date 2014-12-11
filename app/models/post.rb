class Post < ActiveRecord::Base
	include Chattable

	def self.test
		Post.send('Test', 'Hello!')
	end
end
