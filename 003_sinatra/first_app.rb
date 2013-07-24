require 'sinatra'

get '/' do
  "Hello World!"
end

get '/users/:name' do
  "Hello #{params[:name]}!"
end
