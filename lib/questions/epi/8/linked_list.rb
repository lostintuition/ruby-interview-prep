class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value, nil)
  end

  def add(value)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(value, nil)
  end

  def return_list
    elements = []
    current = @head
    while current.next != nil
      elements << current
      current = current.next
    end
    elements << current
  end

  def return_values_list
    list = return_list
    elements = []
    list.each do |element|
      elements << element.value
    end
    elements
  end

  def self.create(elements)
    list = new(elements.first)
    elements[1..-1].each do |element|
      list.add(element)
    end
    list
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value, next_node)
    @value = value
    @next = next_node
  end

  def to_s
    "#{@value}"
  end
end
