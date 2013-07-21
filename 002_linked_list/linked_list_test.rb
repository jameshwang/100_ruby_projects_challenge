require 'minitest/autorun'
require_relative 'linked_list'

describe LinkedList do
  before do
    @linked_list = LinkedList.new
  end

  it "shouldn't be nil" do
    refute_nil @linked_list
  end

  describe "responds to" do
    it "#next" do assert_respond_to @linked_list, :next end
    it "#value" do assert_respond_to @linked_list, :value end
  end

  it "should store and retrive any value" do
    @linked_list.value = 5.6
    assert_equal 5.6, @linked_list.value
  end

  it "should not point next to anything but a linked_list object" do
    @linked_list.next = 3.4
    assert_nil @linked_list.next

    @linked_list.next = Object.new
    assert_nil @linked_list.next

    @linked_list.next = "asdf"
    assert_nil @linked_list.next
  end

  it "should only point to another linked list object" do
    another_linked_list_object = LinkedList.new
    @linked_list.next = another_linked_list_object
    assert_equal another_linked_list_object, @linked_list.next
  end

  # PURE IMPLEMENTATION. DELETE AND CREATE BETTER INTERFACE
  it "should find the 5th value in a linked list" do
    # Create the a 11 object linked list
    head_linked_list = @linked_list
    last_linked_list_object = @linked_list
    (0..10).each do |num|
      last_linked_list_object.next = LinkedList.new(num * num, nil)
      last_linked_list_object = last_linked_list_object.next
    end

    pointer = head_linked_list
    11.times do |num|
      pointer = pointer.next
      assert_equal num * num, pointer.value
    end
  end

  it "should create a linked list with an array" do
    assert_equal [1, 2, 3].to_ll.class, LinkedList
  end

  it "should create an array from a linked list" do
    array = [1, 2, 3]
    assert_equal array, array.to_ll.to_a
  end

  it "reverses the linked list" # do
  #   array = [1, 2, 3]
  #   assert_equal array.reverse, array.to_ll.reverse.to_a
  # end
end
