get '/' do
	puts "[LOG] Getting /" 
  	erb :"static/index"
end

post '/urls' do
  erb :"static/index"
end

get '/:short_url' do
  erb :"static/index"
end