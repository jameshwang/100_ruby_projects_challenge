require 'active_model'

class Person
  include ActiveModel::Model
  include ActiveModel::Dirty

  attr_accessor :name, :age

  validates_presence_of :name
end
