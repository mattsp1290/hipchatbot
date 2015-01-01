class ReplyValidator < ActiveModel::Validator
  def validate(reply)
  	tags = ReplyGifHelper.tags
  	old_tags = reply.tags
  	old_keywords = reply.keywords
  	old_room = reply.room
  	reply.keywords = reply.keywords.split(', ')
  	errors = false
  	reply.tags = reply.tags.split(', ')
  	reply.tags.each do |tag|
  		if !tags.include? tag
  		  errors = true
          reply.errors[:base] << "Unable to create reply. ReplyGif.net does not have the tag #{tag}"
  		end
  	end
  	begin
  		reply.room = HipChatHelper.get_room_id(reply.room)
  	rescue
  		errors = true
  		reply.errors[:base] << "#{old_room} either is not a room or #{ENV['bot_name']} does not have access"
  	end
  	if errors
  	  reply.tags = old_tags
  	  reply.keywords = old_keywords
  	  reply.room = old_room
  	end
  end
end

class Reply < ActiveRecord::Base
  include ActiveModel::Validations
  serialize :tags, Array
  serialize :keywords, Array
  validates :tags, :keywords, :presence => true
  validates_with ReplyValidator
end
