#! /usr/bin/env ruby

# Write a program that takes as input a set of integers representated by an array, and returns the size of a largest subset of integers in the array having the propery that if two integers are in the subset, then so are all integers between them. For example, if the input is (3,-2,9,8,1,2,0,-1,5,8), the biggest contained range is (-2,-1,0,1,2,3), so you should return 6.

def longest_contained_range(array)
  hash = {}
  array.each do |value|
    hash[value] = 1
  end

  count = 0

  while !hash.empty?
    current = hash.keys.first
    hash.delete(current)
    upper_bound = get_upper_bound(hash, current + 1)
    lower_bound = get_lower_bound(hash, current - 1)

    count = [count, upper_bound - lower_bound - 2].max
  end

  count
end

def get_upper_bound(hash, num)
  current = num
  while hash.has_key?(current)
    hash.delete(current)
    current += 1
  end

  return current
end

def get_lower_bound(hash, num)
  current = num
  while hash.has_key?(current)
    hash.delete(current)
    current -= 1
  end

  return current
end

puts longest_contained_range([3,-2,7,9,8,1,2,0,-1,5,8])
