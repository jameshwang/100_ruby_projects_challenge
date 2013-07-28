require 'minitest/autorun'
require_relative 'inventory'

describe Inventory do
  before do
    @inventory = Inventory.new
  end

  it "should not be nil" do
    refute_nil @inventory
  end

  it "#add any object" do
    object = Object.new
    assert_same object, @inventory.add(object)
  end

  describe "holds a collection of skus" do
    it "should hold an array of objects" do
      object1 = Object.new
      object2 = Hash.new
      @inventory.add object1
      @inventory.add object2

      assert_equal [object1, object2], @inventory.all
    end

    it "should know the inventory count of each object" do
      object1 = Object.new

      @inventory.add object1
      @inventory.add object1

      assert_equal({ object1 => 2}, @inventory.all_with_count)
    end

    it "should have a count of each object" do
      object1 = Object.new
    end
  end


end
