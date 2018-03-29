class String 

	# Parses the user's input and returns an array with the information
	def parse

		command = self.split[0]
		data = self.sub(/#{command}[\s]*/, '')
		data_array = data.split
	
		if data_array[0] =~ /\+\w/
	  		group = data_array[0].sub('+', '')
		else
	  		group = ''
		end

		data.sub!('+' + group + ' ', '')

		date = data_array[-1] if data_array[-2] == 'due'
		date = '' if date.nil?

		data.sub!(/due[\s]?/, '')
		data.sub!(date, '')

		[command, data, group, date]

	end

	# Turns a String into a valid Date
  	def transform_to_date
    	if self == 'today'
     		 Date.today
    	elsif self == 'tomorrow'
     		 Date.today + 1
    	elsif self == 'yesterday'
     		 Date.today - 1
    	else
     		Date.strptime(self, '%d/%m/%Y')
    	end
  	end

end
