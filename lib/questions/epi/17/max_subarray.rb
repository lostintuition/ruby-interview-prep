#! /usr/bin/env ruby

# Calculate the maximum subarray of a given array

def maximum_subarray(array)
  range = [0, 0]
  sum = 0
  min_sum = 0
  min_index = -1
  max_sum = 0
  for i in 0..array.size - 1
    sum += array[i]
    if (sum < min_sum)
      min_sum = sum
      min_index = i
    end

    if (sum - min_sum > max_sum)
      puts max_sum
      max_sum = sum - min_sum
      range = [min_index + 1, i + 1]
    end
  end

  return range
end

puts maximum_subarray([904, 40, 523, 12, -335, -385, -124, 481, -31])

