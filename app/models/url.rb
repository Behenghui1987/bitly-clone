class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	def shorten
		choices_aray = ('a'..'z').to_a + ('1'..'9').to_a
		result_array = choices_aray.sample(6)
		self.short_url = result_array.join("")
	end
end
