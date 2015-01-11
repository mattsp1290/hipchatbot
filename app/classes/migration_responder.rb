class MigrationResponder
  def self.respond(event)
  	if event.message.downcase.include? "migration"
  		Rails.logger.debug '----------------------'
  		Rails.logger.debug 'Migration responder'
  		last_migration = Migration.all.sort_by{|migration| migration.full_number}.last
  		message = ""
  		if event.message.downcase.include? "new"
  			migration = Migration.new
  			migration.owner = event.mention_name
  			numbers = last_migration.number.split('.')
  			if numbers.size == 2
  				numbers << 0
  			end
  			if (event.message.downcase.include?("version")) && numbers.size == 3
  				numbers.delete_at(-1)
  			end
  			numbers[-1] = numbers[-1].to_i() + 1
  			number = numbers.join('.')
  			Rails.logger.debug '----------------------'
  			Rails.logger.debug numbers
  			migration.number = number
  			migration.save
  			message = "@#{event.mention_name} has claimed migration #{number}"
  		else
  			message = "The last migration was #{last_migration.number} and it was claimed by #{last_migration.owner}"
  		end
  		HipChatHelper.send_message(event.room, message)
  		return true
  	end
  	return false
  end
end