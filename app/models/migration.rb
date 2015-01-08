class Migration < ActiveRecord::Base
	def full_number
		number_split = self.number.split('.')
		full_number_string = format('%02d', number_split[0]) + format('%02d', number_split[1])
		if (number_split.size == 3)
			full_number_string += format('%02d', number_split[2])
		else
			full_number_string += '00'
		end
		return full_number_string.to_i
	end
end