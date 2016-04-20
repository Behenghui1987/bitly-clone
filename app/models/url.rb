class Url < ActiveRecord::Base
	validates_presence_of :long_url, :short_url
	# validates :long_url, format: {with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/, message: "sorry its not a URL" }
	# This is Sinatra! Remember to create a migration!
	def shorten
		choices_aray = ('a'..'z').to_a + ('1'..'9').to_a
		result_array = choices_aray.sample(6)
		self.short_url = result_array.join("")
	end
end
