#! /usr/bin/env ruby

# Find the length of the longest non-decreasing sequence

def find_longest_non_decreasing_sequence(array)
  longest_sequence_length = []
  max_length = 0
  for i in 0..array.size - 1
    longest_sequence_length[i] = 1
    for j in 0 ..i - 1
      if array[i] >= array[j]
        longest_sequence_length[i] = [longest_sequence_length[j] + 1, longest_sequence_length[i]].max
      end
    end
    max_length = [max_length, longest_sequence_length[i]].max
  end
  return max_length
end

puts find_longest_non_decreasing_sequence([5, 3, 4, 8, 6, 7])
