get '/' do
  erb :"static/index", locals: {url: ''}
end

post '/urls' do
	long_url = params[:long_url]
	@new_url = Url.new(long_url: long_url)
	@new_url.shorten
	@new_url.save

    erb :"static/index", locals: {url: @new_url.short_url}
end

get '/:short_url' do
	#b is an object with its key & value
	b = Url.find_by(short_url: params[:short_url])
	count = b.counter.to_i
	count += 1
	b.counter = count
	b.save
	
	redirect "http://" + b.long_url
end
 
print Url.all