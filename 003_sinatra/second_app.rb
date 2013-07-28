require 'rubygems'
require 'yaml'
require 'sinatra'
require 'active_record'

# class User < ActiveRecord::Base; end

class User
  def self.all
    YAML.load_file("model/users.yml")
  end
end

get "/" do
  User.all
end
