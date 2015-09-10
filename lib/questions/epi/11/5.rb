#! /usr/bin/env ruby

require 'pqueue'

# You want to compute the running median of a sequence of numbers. The sequence is presented to you in a streaming fashion -- you cannot back up to read an earlier value, and you need to output the median after reading in each new element. For example, if the input is 1,0,3,5,2,0,1 the output is 1,0.5,1,2,2,1.51.
#
# Design an algorithm for computing the running median of a sequence.

# Create a max heap and a min heap. Keep the min and max heaps even in size. Keep the lower half of the numbers in the max heap and the higher half of the numbers in the min heap.
#
# When inserting, there are two cases: when the value belongs to the min heap and when the value belongs to the max heap
#
# Two more cases: total size is even and total size is odd

def running_median(input)
  if (input.empty?)
    return []
  end

  lesser_half = PQueue.new(){ |a,b| a > b }
  greater_half = PQueue.new(){ |a,b| a < b }
  output = [input.first]
  greater_half.push(input.first)

  input[1..input.length - 1].each do |value|
    insert_value(value, lesser_half, greater_half)
    output << get_median(lesser_half, greater_half)
  end

  return output
end

def get_median(lesser_half, greater_half)
  if (lesser_half.size > greater_half.size)
    return lesser_half.peek
  elsif (lesser_half.size < greater_half.size)
    return greater_half.peek
  else
    return (greater_half.peek + lesser_half.peek) / 2.0
  end
end

def insert_value(value, lesser_half, greater_half)
  # invariant that greater_half will contain at least 1 item
  heap_to_add_to = value >= greater_half.peek ? greater_half : lesser_half
  heap_to_add_to.push(value)

  rebalance_heaps(lesser_half, greater_half)
end

def rebalance_heaps(lesser_half, greater_half)
  # Only rebalance if the heap size differ by more than 1
  if (lesser_half.size - greater_half.size).abs > 1
    heap_to_remove_from = greater_half.size > lesser_half.size ? greater_half : lesser_half
    heap_to_add_to = greater_half.size < lesser_half.size ? greater_half : lesser_half

    heap_to_add_to.push(heap_to_remove_from.pop)
  end
end

output = running_median([1,0,3,5,2,0,1])
puts output
