require 'rubygems'
require 'twilio-ruby'
require 'yaml'


# I know, I know, too much configuration and not enough convention
config = YAML.load(File.open('config.yml'))
account_sid = config['account_sid']
auth_token = config['auth_token']
from_phone_number = config['from_phone_number']
to_phone_number = config['to_phone_number']



@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.sms.messages.create(
  :from => from_phone_number,
  :to => to_phone_number,
  :body => 'Testing out the ruby gem of Twilio'
)

