#! /usr/bin/env ruby

# Given an array of comparable objects, you can find either the min or the max of the elements in the array with n - 1 comparisions, where n is the length of the array.
#
# Comparing elements may be expensive, e.g., a comparison may involve an number of necested calls or the elements being ompared may be long strings. Therefore, it is natural to ask if both the min and the max can be computed with less than the 2(n - 1) comparisons to compute the min and the max independently.
#
# Design an algorithm to find the min and max elements in an array. For example, if A = <3,2,5,1,2,4>, you should return 1 for the min and 5 for the max.


def find_max_and_min(array)
  if array.length <= 1
    return {min: array.first, max: array.first}
  end

  global_min_max = min_max(array[0], array[1])
  i = 2
  while i < array.length - 1
    local_min_max = min_max(array[i], array[i+1])
    global_min_max[:min] = local_min_max[:min] if local_min_max[:min] < global_min_max[:min]
    global_min_max[:max] = local_min_max[:max] if local_min_max[:max] > global_min_max[:max]
    i += 2
  end

  if array.length.odd?
    global_min_max[:min] = array.last if array.last < local_min_max[:min]
    global_min_max[:max] = array.last if array.last > local_min_max[:max]
  end

  return global_min_max
end

def min_max(v1, v2)
  if (v1 < v2)
    return {min: v1, max: v2}
  end
end


puts find_max_and_min([0, 1, 2, 3, 4, 5, 6])
puts find_max_and_min([0])
