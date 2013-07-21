class LinkedList
  attr_accessor :value
  attr_reader :next

  def initialize(value = nil, next_object = nil)
    @value = value
    @next = next_object
  end

  def next=(linked_list_object)
    @next = linked_list_object if linked_list_object.class == self.class
  end

  def to_a
    array = []
    current = self
    while current do
      array << current.value
      current = current.next
    end
    array
  end

  # def reverse
  #   current_object = self
  #   current_object.next = nil
  #   while current_object do
  #     next_object = current_object.next
  #     head = next_object.next = current_object
  #     current_object = next_object
  #   end
  #   head
  # end
end

class Array
  def to_ll
    # Create it backwards
    current = nil
    self.reverse.each do |value|
      current = LinkedList.new(value, current)
    end
    current
  end
end
