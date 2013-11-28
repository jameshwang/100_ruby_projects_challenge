require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/hello-monkey' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello Monkey', :voice => 'alice'
  end.text
end
