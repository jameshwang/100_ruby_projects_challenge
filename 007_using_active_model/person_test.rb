require 'minitest/autorun'
require_relative 'person'

describe Person do
  it "should not be nil" do
    refute_nil Person.new
  end

  it "should validate the presence of name" do
    person = Person.new(:name => "james")
    assert person.valid?
    person.name = ""
    refute person.valid?
  end

  # it "should notify that there is a change" do
  #   person = Person.new
  #   refute person.changed?
  #   assert_equal [], person.changed

  #   person.name = "James"
  #   assert person.changed?
  #   assert_equal [name: "James"], person.changed
  # end
end
