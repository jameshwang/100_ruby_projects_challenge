require 'sinatra'

get '/' do
  haml :index
end

get '/users/:name' do
  "Hello #{params[:name]}!"
end
