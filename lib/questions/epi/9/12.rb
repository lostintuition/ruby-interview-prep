#! /usr/bin/env ruby

# How would you implement a queue given a library implementing stacks

class Stack
  def initialize
    @array = Array.new
  end

  def push(item)
    @array.push(item)
  end

  def pop
    @array.pop
  end

  def size
    @array.size
  end

  def empty?
    @array.empty?
  end
end

class Queue
  def initialize
    @enqueue_stack = Stack.new
    @dequeue_stack = Stack.new
  end

  def enqueue(item)
    @enqueue_stack.push(item)
  end

  def dequeue
    if @dequeue_stack.empty?
      add_to_dequeue
    end
    @dequeue_stack.pop
  end

  def add_to_dequeue
    while (temp_value = @enqueue_stack.pop)
      @dequeue_stack.push(temp_value)
    end
  end
end

queue = Queue.new
queue.enqueue("1")
queue.enqueue("2")
queue.enqueue("3")
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue


queue.enqueue("1")
queue.enqueue("2")
puts queue.dequeue
queue.enqueue("3")
puts queue.dequeue
puts queue.dequeue
