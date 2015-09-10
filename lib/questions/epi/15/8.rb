#! /usr/bin/env ruby

# ---------------------------------------------------------------------------------
# Numbers of the form a + b sqrt(q), where a and b are nonnegative integers, and q is an integer which is not the square of another integer, have special properties, e.g., they are closed uner addition and multiplication. Some of the first few numbres of this form are given in figure 15.4
#
# (0 + 0 sqrt(2))
# (1 + 0 sqrt(2))
# (0 + 1 sqrt(2))
# (2 + 0 sqrt(2))
# (1 + 1 sqrt(2))
# (0 + 2 sqrt(2))
# (3 + 0 sqrt(2))
# (2 + 1 sqrt(2))
# (1 + 2 sqrt(2))
# (4 + 0 sqrt(2))
# (0 + 3 sqrt(2))
# (3 + 1 sqrt(2))
# (2 + 2 sqrt(2))
#
# Design an algorithm for efficiently computing the k smallest numbers of the form a + b sqrt(2) for nonnegative integers a and b.
#
# ----------------------------------------------------------------------------------

# Brute force method: calculate each point by hand
# Hard thing to do: figure out what the order is
# Sqrt(2) = 1.41
#
# Possibility: calculate all of the (a) and (a sqrt(2)) values. Then enumerate over the smallest values for each side
#
# Brute force: find all answers by iterating over all possibilities for the first n numbers. i.e. (0, 0), (0, 0), (0, 1), (1, 0), (1, 1) which is roughly n^2

class ABSqrt2
  attr_accessor :a, :b, :val

  def initialize(a, b)
    @a = a
    @b = b
    @val = a + b * Math.sqrt(2)
  end

  def to_s
    "#{@a}, #{@b}"
  end
end

def get_k_smallest_numbers(k)
  i = 0
  j = 0

  results = [ABSqrt2.new(0, 0)]
  (1..k).each do |l|
    i_val = ABSqrt2.new(results[i].a + 1, results[i].b)
    j_val = ABSqrt2.new(results[j].a, results[j].b + 1)
    if (i_val.val < j_val.val)
      results.push(i_val)
      i += 1
    elsif j_val.val < i_val.val
      results.push(j_val)
      j += 1
    else
      results.push(j_val)
      i += 1
      j += 1
    end
  end

  return results
end

puts get_k_smallest_numbers(5)
