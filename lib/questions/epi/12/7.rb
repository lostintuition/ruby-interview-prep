#! /usr/bin/env ruby

# Call a 2D array sorted if its rows and columns are in increasing sorted order
#
# Design an algorithm that takes a 2D sorted array and a number and check whether that number appears in the array. For example, if the input is in the 2D sorted array in Figure 12.3, and the number is 7, your algorithm should return false; if the number is 8, your algorithm should return true.

def number_exists?(sorted_array, num)
  rows_index = 0
  rows_size = sorted_array.length
  columns_index = sorted_array.first.length - 1
  number_exists = false
  while rows_index < rows_size && columns_index >= 0
    current_value = sorted_array[rows_index][columns_index]
    return true if current_value == num

    columns_index -= 1 if current_value > num
    rows_index += 1 if current_value < num
  end

  number_exists
end


sorted_array = []

sorted_array[0] = [-1, 2, 4, 4, 6]
sorted_array[1] = [1, 5, 5, 9, 21]
sorted_array[2] = [3, 6, 6, 9 ,22]
sorted_array[3] = [3, 6, 8, 10, 24]
sorted_array[4] = [6, 8, 9, 12, 25]
sorted_array[5] = [8, 10, 12, 13, 40]

puts number_exists?(sorted_array, 8)
puts number_exists?(sorted_array, 40)
puts number_exists?(sorted_array, 9)
puts number_exists?(sorted_array, 41)
